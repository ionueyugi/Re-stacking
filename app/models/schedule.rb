class Schedule < ApplicationRecord
	belongs_to :user
	has_one :evaluation
	has_many :notifications, dependent: :destroy
end
