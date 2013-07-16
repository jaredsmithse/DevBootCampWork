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
	@newest_post = Post.create(params[:post])
  category.posts << @newest_post
	redirect '/success'
end

get '/edit/:hash' do
  @edit_post = Post.find_by_id(SecretKeyRelation.find_by_key(params[:hash]).post_id)
  erb :edit_post
end



