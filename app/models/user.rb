class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups
  has_many :accounts
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
