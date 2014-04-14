class Question < ActiveRecord::Base
	belongs_to :owner, class_name: User
	belongs_to :test_list, class_name: TestList

	validates :text, length: { in: 1..100 }
	validates :owner, presence: true

end
