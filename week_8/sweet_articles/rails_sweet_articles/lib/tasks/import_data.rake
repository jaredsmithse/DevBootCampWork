require 'csv'

namespace :db do
	
	task :import_data => :environment do
		
		CSV.foreach("/Volumes/Storage/JaredSmith/Desktop/backup.csv", {:headers => true, :header_converters => :symbol}) do |row|
			article = Article.create(title: row[:title],description: row[:description],url: row[:url])
			category = Category.find_or_create_by_title(row[:category])
			category.articles << article
			
			row[:tags].split(", ").each do |tag|
				tag = Tag.create(title: tag)
				article.tags << tag
			end

		end	

	end
end
