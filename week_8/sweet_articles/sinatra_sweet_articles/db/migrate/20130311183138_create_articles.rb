class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text   :description
      t.string :url
      t.string :category
      t.string :tags
    end
  end
end
