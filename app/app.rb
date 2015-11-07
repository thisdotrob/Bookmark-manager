ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'models/init'
require_relative 'controllers/init'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :views, Proc.new { File.join(root, "../views") }
  use Rack::MethodOverride
  register Sinatra::Flash

  set :session_secret, 'bollocks'

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  get '/' do
    redirect '/sessions/new'
  end

  run! if app_file == $0

end
