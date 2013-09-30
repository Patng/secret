class Community < ActiveRecord::Base
	
	validates :description, presence: true
	validates :category, presence: true
	validates :location, presence: true
	validates :admin_id, presence: true

	has_and_belongs_to_many :users, :uniq => true
	belongs_to :owner, :class_name => "User", :foreign_key => "admin_id"
	has_many :posts

end
