class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name,      :null => false
      t.string :last_name,       :null => false
      t.string :username,        :null => false, :limit => 32
      t.string :email,           :null => false
      t.integer :karma,					 :default => 0

      t.timestamps
    end
  end
end
