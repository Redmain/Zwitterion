class Answer < ActiveRecord::Base
	belongs_to :question, foreign_key: :question_id
	validates :text, length: { in: 1..40 }
end
