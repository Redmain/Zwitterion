class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, uniqueness: true, length: {minimum: 2}
  validates :login, presence: true, uniqueness: true, length: {minimum: 2}
  scope :approved, -> {where(state: :approved)}
end
