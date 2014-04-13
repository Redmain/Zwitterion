class TestList < ActiveRecord::Base
	belongs_to :owner, class_name: User
	has_many :questions, foreign_key: :test_list_id

	validates :name, length: { in: 1..100 }
	validates :owner, presence: true
end
