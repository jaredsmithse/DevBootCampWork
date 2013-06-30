require_relative '../../db/config'


class Student < ActiveRecord::Base
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create
  validates_format_of :phone, :with => /\(*\d{3,}\)*\-*\s*\d{3,}\-*\d{4,}\s*[x]*\d*/, :on => :create
  validates_uniqueness_of :email, :case_sensitive => false
  validates :age, :numericality => { :greater_than => 5 }

  def full_name
    first_name + " " + last_name
  end

  # def name
  #   first_name + " " + last_name
  # end

  def age
    now = Date.today
    age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

end
