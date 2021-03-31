require 'rails_helper'
RSpec.describe 'Create new Group', type: :feature do
  # before(:each) do
  # User.create(id: 1, username: 'Foo Bar', email: 'foo@bar.com', password: '12345678')
  # Group.create(name: 'Bar', icon: 'icon.jpeg', user_id: 1)
  # end
  # has_one_attached :icon
  # validates :width, presence: true, if: ->(item) { !item.icon.attached?}

  it 'is valid if image is attached' do
    file = Rails.root.join('spec', 'support', 'assets', 'group', 'icon.jpeg')
    icon = ActiveStorage::Blob.create_after_upload!(
      io: File.open(file, 'rb'),
      filename: 'icon.jpeg',
      content_type: 'icon/jpeg' # Or figure it out from `name` if you have non-JPEGs
    ).signed_id
    group = Group.create(name:"music",icon: icon)
    expect(group.valid?).to eq true
  end
end
