class Category < ActiveRecord::Base
	has_many :communities
end
