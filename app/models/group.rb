class Group < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_one_attached :icon
  has_many :accounts
  validates :name, presence: true
  validates :icon, presence: true
end
