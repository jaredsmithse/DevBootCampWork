class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.string :context
      t.timestamps
    end
  	
  	create_table :user_skills do |t|
  		t.integer :user_id
  		t.integer :skill_id
  		t.integer :proficiency
  		t.timestamps
  	end
  end
end
