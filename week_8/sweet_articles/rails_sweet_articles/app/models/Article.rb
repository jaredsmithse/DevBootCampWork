class Article < ActiveRecord::Base
	attr_accessible :title, :description, :url
	belongs_to :category
	has_and_belongs_to_many :tags

	def url_title
		title.gsub(" ","-")
	end

end