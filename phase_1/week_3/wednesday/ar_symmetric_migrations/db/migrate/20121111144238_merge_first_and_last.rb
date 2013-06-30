require_relative '../config'

class MergeFirstAndLast < ActiveRecord::Migration
  def up
    add_column :students, :name, :string, :limit => 50
    add_column :students, :address, :string

    Student.all.each do |student|
      student.update_attributes(:name => student.full_name)
    end

    remove_column :students, :first_name
    remove_column :students, :last_name
  end

  def down
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string

    Student.all.each do |student|
      student.update_attributes(first_name: (student.name.split(" ").first))
      student.update_attributes(last_name: (student.name.split(" ").last))
    end

    remove_column :students, :name
    remove_column :students, :address
  end
end
