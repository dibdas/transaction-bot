class Account < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :user
  validates :name, presence: true
  validates :amount, presence: true
end
