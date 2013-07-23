class AddIndexToKarma < ActiveRecord::Migration
  def change
  	add_index :karma_points, :user_id, :name => 'user_id_index'
  end
end
