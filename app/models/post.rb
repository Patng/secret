class Post < ActiveRecord::Base
	validates :description, presence: true
	validates :community_id, presence: true

	belongs_to :user
	belongs_to :community
end
