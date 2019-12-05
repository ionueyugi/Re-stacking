class Post < ApplicationRecord
	has_many :post_comments, dependent: :destroy
	has_many :notifications, dependent: :destroy
	belongs_to :user
	attachment :profile_image
end
