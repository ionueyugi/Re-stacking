class Post < ApplicationRecord
	has_many :post_comments, dependent: :destroy
	has_many :notifications, dependent: :destroy
	has_many :favorites, dependent: :destroy
  	has_many :favorites_users, through: :favorites, source: :user
	belongs_to :user
	attachment :post_image
	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
