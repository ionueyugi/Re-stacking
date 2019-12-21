class Evaluationtime < ApplicationRecord
	belongs_to :evaluation
	enum time_score: { 無理: 0 , あまりできなかった: 1, どちらともいえない: 2, ままあ達成できた: 3, 達成できた: 4 }
end
