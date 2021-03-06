class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable,
         :rememberable, :trackable, :validatable

  has_and_belongs_to_many :communities, :uniq => true
  has_many :owned, :class_name => "Community", :foreign_key => "admin_id"
  has_many :posts
  has_many :community_posts, through: :communities, source: :posts

  acts_as_voter
  acts_as_messageable
 end
