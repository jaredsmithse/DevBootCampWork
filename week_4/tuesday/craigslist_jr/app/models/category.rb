class Category < ActiveRecord::Base
  has_many :post, :class_name => "Post", :foreign_key => "category_id"
end
