ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  set :session_secret, 'bollocks'

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  get '/' do
    erb :signup
  end

  post '/do-signup' do
    user = User.create( email:          params[:email],
                        password:       params[:password],
                        password_confirmation: params[:password_confirmation])


    if user.save
      session[:user_id] = user.id
      redirect '/links'
    else
      error_msg = ''
      user.errors.each do |error|
        error_msg << "#{error[0]}\n"
      end
      flash[:error] = error_msg
      flash[:email] = params[:email]
      redirect '/'
    end

  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
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
