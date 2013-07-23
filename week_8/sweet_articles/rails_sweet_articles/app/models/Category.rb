class Category < ActiveRecord::Base
	attr_accessible :title
	has_many :articles

	def url_title
		title.gsub(" ","-")
	end
	
end