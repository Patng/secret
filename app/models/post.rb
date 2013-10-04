class Post < ActiveRecord::Base

	has_attached_file :image, styles: { medium: "320x240>"}

	validates :description, presence: true
	validates :community_id, presence: true
	validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
																size: { less_than: 2.megabytes }

	belongs_to :user
	belongs_to :community

	acts_as_votable
end
