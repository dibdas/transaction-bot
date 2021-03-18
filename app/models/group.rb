# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :transactions_groups, dependent: :destroy
  has_many :transactions, through: :transactions_groups
  # has_one_attached :icon
  # mount_uploader :icon, ImageUploader
end
