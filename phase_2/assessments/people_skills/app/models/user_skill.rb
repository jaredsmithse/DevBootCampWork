class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  before_save :set_defaults

  def set_defaults
  	self.proficiency ||= 0
  end

end
