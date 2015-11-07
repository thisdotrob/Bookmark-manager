ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'

class BookmarkManager < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride
  register Sinatra::Flash

  set :session_secret, 'bollocks'

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  get '/' do
    redirect '/sessions/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:message] = 'Goodbye!'
    redirect '/links'
  end

  post '/sessions' do
    user = User.first(email: params[:email])
    if user.nil?
      flash[:sign_in_error] = 'User not found'
    elsif user.password == params[:password]
      session[:user_id] = user.id
      flash[:message] = "#{user.email} signed in."
      redirect '/links'
    else
      flash[:sign_in_error] = 'Incorrect password'
    end
    redirect '/sessions/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create( email:                 params[:email],
                        password:              params[:password],
                        password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      flash[:message] = "Welcome to bookmark manager, #{user.email}."
      redirect '/links'
    else
      flash[:errors] = user.errors.full_messages
      flash[:email] = params[:email]
      redirect '/users/new'
    end
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.first_or_create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/links/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  run! if app_file == $0

end
