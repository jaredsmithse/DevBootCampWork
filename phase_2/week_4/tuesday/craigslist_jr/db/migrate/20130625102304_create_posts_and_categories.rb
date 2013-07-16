class CreatePostsAndCategories < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
      t.column :title, :string
      t.column :description, :text
      t.column :cost, :decimal, precision: 10, scale: 2
      t.column :location, :string
      t.column :category_id, :integer
    end
    
  	create_table :categories do |t|
  		t.column :title, :string
  	end
  end  
end
