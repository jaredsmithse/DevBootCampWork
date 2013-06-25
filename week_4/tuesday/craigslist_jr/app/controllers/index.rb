get '/' do
  @categories = Category.all
  unless params[:category].nil?
  	@current_category = params[:category]
	  @posts_by_category = Category.where('title = ?',params[:category])
  	erb :posts_by_category
  else
  	erb :index
  end
end

get '/success' do
	@all_posts = Post.all
	erb :post_success
end

post '/submit' do
	p params
	@new_post = Post.create(params)
	redirect '/success'
end
