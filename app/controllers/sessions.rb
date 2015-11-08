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
    user = User.authenticate(params[:email], params[:password])
    if user.nil?
      flash.next[:sign_in_error] = 'Log in details incorrect.'
      redirect '/sessions/new'
    else
      session[:user_id] = user.id
      redirect '/links'
    end

  end

end
