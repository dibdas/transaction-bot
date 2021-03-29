class Account < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :user
  validates :name, presence: true
end
