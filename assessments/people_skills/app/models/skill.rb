class Skill < ActiveRecord::Base
	validates_uniqueness_of :name
  has_many :user_skills
  has_many :users, through: :user_skills

  def user_with_proficiency(score)
  	User.find(UserSkill.find_by_skill_id_and_proficiency(id, score).user_id)
  end
end
