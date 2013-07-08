class User < ActiveRecord::Base
  has_many :user_skills
  has_many :skills, through: :user_skills

  def proficiency_for(skill)
  	skill_relation = UserSkill.find_by_user_id_and_skill_id(id, skill.id)
  	skill_relation ? skill_relation.proficiency : 0
  end

  def set_proficiency_for(skill, proficiency_score)
  	skill_relation = UserSkill.find_by_user_id_and_skill_id(id, skill.id)
  	skill_relation.proficiency = proficiency_score
  	skill_relation.save
  end
end
