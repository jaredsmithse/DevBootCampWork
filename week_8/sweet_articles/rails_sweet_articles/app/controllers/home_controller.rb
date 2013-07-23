class HomeController < ApplicationController
	def index
		@categories = Category.all
		@articles = []
		@categories.each do |category|
			@articles << category.articles
		end
	end
end