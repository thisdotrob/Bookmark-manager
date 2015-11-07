class BookmarkManager < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create( email:                 params[:email],
                        password:              params[:password],
                        password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      flash.next[:welcome_msg] = "Welcome to bookmark manager, #{user.email}."
      redirect '/links'
    else
      flash.next[:errors] = user.errors.full_messages
      flash.next[:email] = params[:email]
      redirect '/users/new'
    end
  end

end
