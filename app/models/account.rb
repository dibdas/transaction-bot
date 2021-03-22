class Account < ApplicationRecord
  # has_many :transactions_groups, dependent: :destroy
  # has_many :groups, through: :transactions_groups
  belongs_to :group
  belongs_to :user
end
