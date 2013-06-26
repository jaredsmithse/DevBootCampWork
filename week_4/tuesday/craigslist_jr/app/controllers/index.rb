get '/' do
  @categories = Category.all
  erb :index
end

post '/' do
  redirect '/'
end

get '/category/:id' do
  @posts_by_category = Post.where('category_id = ?', params[:id])
  erb :posts_by_category
end

get '/posts/:id' do 
  @post = Post.find_by_id(params[:id])
  erb :post_description
end

get '/success' do
	@all_posts = Post.all
	erb :post_success
end

post '/submit' do
  category = Category.find_or_create_by_title(params[:category])
	post = Post.create(params[:post])
  category.posts << post
	redirect '/success'
end

get '/edit/:id' do
  @edit_post = Post.find_by_id(params[:id])
  erb :edit_post
end



