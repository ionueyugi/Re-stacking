class Favorite < ApplicationRecord
	balongs_to :posts
	belongs_to :user
end
