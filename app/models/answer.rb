class Answer < ActiveRecord::Base
	belongs_to :question, class_name: Question

	validates :text, length: { in: 1..300 }
	validates :answer_value, presence: true
end
