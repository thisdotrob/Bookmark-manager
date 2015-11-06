ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'bollocks'

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def validate_password(password, password_check)
    password == password_check ? true : fail('passwords do not match')
  end

  get '/' do
    erb :signup
  end

  get '/links' do
    @user_name = current_user.username
    @links = Link.all
    erb :'links/index'
  end

  post '/verify-pw' do
    p params
    begin
      password1 = params[:password]
      password2 = params[:password_check]
      validate_password(params[:password], params[:password_check])
      redirect('/do-signup', 307)
    rescue Exception => e
      p "error message: #{e.inspect}"
      redirect '/fix_pw'
    end

  end

  get '/fix_pw' do
    erb :'signup/fix_pw'
  end


  post '/do-signup' do
    user = User.create(   username:   params[:username],
                          email:      params[:email],
                          password:   params[:password] )
    session[:user_id] = user.id
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links/saving' do
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
