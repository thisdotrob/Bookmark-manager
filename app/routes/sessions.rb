class BookmarkManager < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.next[:exit_msg] = 'Goodbye!'
    redirect '/links'
  end

  post '/sessions' do
    user = User.first(email: params[:email])
    if user.nil?
      flash.next[:sign_in_error] = 'User not found'
    elsif user.password == params[:password]
      session[:user_id] = user.id
      redirect '/links'
    else
      flash.next[:sign_in_error] = 'Incorrect password'
    end
    redirect '/sessions/new'
  end

end
