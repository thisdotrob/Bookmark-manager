ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/link'
require_relative 'models/tag'

class BookmarkManager < Sinatra::Base
  set :session, true

  get '/links' do
    @links = Link.all
    erb :'links/index'
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
