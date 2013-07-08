class Event < ActiveRecord::Base
	validates :date, presence: true
	validates :organizer_name, presence: true
	validates :organizer_email, presence: true
	validates :title, presence: true
	validates_uniqueness_of :title
	before_save :date_cannot_be_in_the_past


	def date_cannot_be_in_the_past
		p date < Date.today
		p date.present? 
		if date.present? && date < Date.today
			errors.add(:date, "can't be in the past")
			return false
		end
	end

end
