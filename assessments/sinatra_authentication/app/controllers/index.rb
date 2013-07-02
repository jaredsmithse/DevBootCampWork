get '/' do
  # render home page
	@users = User.all if logged_in?	
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  user = User.find_by_email(params[:email])
  stored_password = user.password_hash
  given_password = Digest::MD5.hexdigest(params[:password_hash] + user.salt)
  if stored_password == given_password
    session[:user_id] = set_current_user(user.email)
    redirect '/'
  else
    redirect '/'
  end
end

delete '/sessions/:id' do
	session[:user_id] = nil
  @current_user = nil
  # sign-out -- invoked via AJAX
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  User.create(create_user(params[:user]))
  session[:user_id] = set_current_user(params[:user][:email])
  redirect '/'
end
