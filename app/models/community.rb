class Community < ActiveRecord::Base
	
	validates :description, presence: true
	validates :category, presence: true
	validates :location, presence: true

end
