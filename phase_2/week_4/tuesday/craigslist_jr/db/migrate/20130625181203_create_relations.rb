class CreateRelations < ActiveRecord::Migration
  def change
  	create_table :secret_key_relations do |t|
  		t.string :key 
  		t.integer :post_id
  	end
  end
end
