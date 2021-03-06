class TestList < ActiveRecord::Base
	belongs_to :owner, class_name: User
	has_many :questions, foreign_key: :test_list_id, dependent: :destroy

	validates :name, length: { in: 1..30 }
	validates :owner, presence: true
end
