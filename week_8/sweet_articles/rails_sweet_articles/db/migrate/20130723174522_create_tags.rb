class CreateTags < ActiveRecord::Migration
  def change
  	create_table :tags do |t|
	  	t.string :title
  		t.references :articles_tags
  	end
  end
end
