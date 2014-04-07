class Question < ActiveRecord::Base
	belongs_to :owner, class_name: User

	validates :text, length: { in: 1..100 }
	validates :owner, presence: true
end
