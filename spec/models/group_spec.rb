# rubocop:disable Lint/UselessAssignment
require 'rails_helper'

RSpec.describe Group, type: :model do
  test_user = User.create!(username: 'kxykc', email: 'a3@gmail.com', password: 'hsjoarty067')
  test_group = Group.create!(name: 'test_group', user_id: test_user.id)

  it 'should fail to create a group user' do
    ev = Group.create(name: 'test_group')
    expect(ev.persisted?).to eql(false)
  end

  it 'should create group' do
    ev = Group.create(name: 'test_group', user_id: test_user.id)
    expect(ev.persisted?).to eql(true)
  end
end
