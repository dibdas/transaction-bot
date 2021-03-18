class TransactionsGroup < ApplicationRecord
  belongs_to :group
  #belongs_to :transaction
  has_many :transactions,through: :transactions_groups
  #has_one :user, foreign_key: "transaction_id", class_name: "Transaction"
end
