class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, uniqueness: true, length: {minimum: 2}
  validates :login, presence: true, uniqueness: true, length: {minimum: 2}
  scope :approved, -> {where(state: :approved)}
  after_create :update_state

  has_many :questions, foreign_key: :owner_id
  has_many :test_lists, foreign_key: :owner_id

  def update_state
    self.update_attributes(:state => 'approved')
  end
end
