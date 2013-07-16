helpers do
	def format_post_params(args)
		args[:category_id] = Category.find_by_title(args[:category])
		args
	end
end