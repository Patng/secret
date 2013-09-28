class Community < ActiveRecord::Base
	validates :description, presence: true
end
