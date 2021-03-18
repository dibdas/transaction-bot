class Group < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  #has_one_attached :icon
  #mount_uploader :icon, ImageUploader
end
