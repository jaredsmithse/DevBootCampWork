class CreateArticles < ActiveRecord::Migration
  def change
  	create_table :articles do |t|
  		t.string :title
  		t.text	 :description
  		t.string :url
  		t.references :articles_tags
  		t.references :category
  	end
  end
end
