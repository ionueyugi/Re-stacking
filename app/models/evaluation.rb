class Evaluation < ApplicationRecord
	belongs_to :event
	has_many :evaluationtimes
	has_many :qualitys
	has_many :achievements
end
