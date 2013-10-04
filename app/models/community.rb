class Community < ActiveRecord::Base

	has_attached_file :cover, styles: { medium: "320x100#" }
	
	validates :description, presence: true
	validates :category_id, presence: true
	validates :location_id, presence: true
	validates :admin_id, presence: true
	validates_attachment :cover, presence: true, 
																content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
																size: { less_than: 2.megabytes }

	has_and_belongs_to_many :users, :uniq => true
	belongs_to :owner, :class_name => "User", :foreign_key => "admin_id"
	has_many :posts
	belongs_to :category
	belongs_to :location

end
