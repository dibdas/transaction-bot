require 'rails_helper'
RSpec.describe 'Create new Group', type: :feature do
  before(:each) do
    User.create(id: 1, username: 'Foo Bar', email: 'foo@bar.com', password: '12345678')
  end
  it 'is valid if image is attached' do
    file = Rails.root.join('spec', 'support', 'assets', 'group', 'icon.jpeg')
    icon = ActiveStorage::Blob.create_and_upload!(
      io: File.open(file, 'rb'),
      filename: 'icon.jpeg',
      content_type: 'icon/jpeg'
    ).signed_id
    group = Group.new(name: 'music', icon: icon, user_id: 1)
    expect(group.valid?).to eq true
  end
end
