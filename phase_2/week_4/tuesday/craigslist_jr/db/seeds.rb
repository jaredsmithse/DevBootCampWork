categories = ["housing","for sale","jobs","services"]
categories.each do |category|
	Category.create(:title => category)
end
