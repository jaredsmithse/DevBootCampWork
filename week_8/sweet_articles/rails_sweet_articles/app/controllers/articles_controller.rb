class ArticlesController < ApplicationController
	
	def index 

  end

  def show
    @article = Article.find_by_title(params[:id].gsub("-"," "))
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end


end