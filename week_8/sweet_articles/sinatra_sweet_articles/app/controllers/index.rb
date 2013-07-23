get '/' do
  @articles = Article.all.group_by &:category
  erb :index
end

get '/articles/:month/:day/:year/:title' do
  @article = Article.find_by_url "articles/#{params[:month]}/#{params[:day]}/#{params[:year]}/#{params[:title]}"
  erb :show
end

get '/articles/new' do
  @article = Article.new
  erb :new
end

post '/articles' do
  @article = Article.new params[:article]
  if @article.save
    redirect to(@article.url)
  else
    render :new
  end
end
