require_relative '../config'

class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |student|
      student.string :first_name
      student.string :last_name
      student.string :gender
      student.string :email
      student.string :phone
      student.date   :birthday
      student.timestamps
    end
  end
end
