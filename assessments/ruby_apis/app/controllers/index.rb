get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/show' do
	OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
	@user = Octokit.user(params[:user])
	erb :show_user
end