ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'

class BookmarkManager < Sinatra::Base
  set :session, true

  get '/' do
    erb :signup
  end

  get '/links' do
    @user_count = User.count
    user = User.first
    @user_name = user.username unless user.nil?
    @links = Link.all
    erb :'links/index'
  end

  post '/do-signup' do
    User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links/saving' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
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
