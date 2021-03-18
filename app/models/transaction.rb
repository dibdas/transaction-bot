# frozen_string_literal: true

class Transaction < ApplicationRecord
  has_many :transactions_groups, dependent: :destroy
  has_many :groups, through: :transactions_groups
end
