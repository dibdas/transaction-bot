require 'rails_helper'

RSpec.describe 'Create group' do
  let(:group) { Group.create(name: 'Bar', icon: 'https://testicons.com/testicon.png', user_id: user.id) }

  it 'should fail to create a group without name' do
    ev = Group.create(icon: 'https://testicons.com/testicon.png')
    expect(ev.persisted?).to eql(false)
  end

  it 'should fail to create a group user' do
    ev = Group.create(name: 'test_group', icon: 'https://testicons.com/testicon.png')
    expect(ev.persisted?).to eql(false)
  end

  it 'should create group' do
    ev = Group.create(name: 'test_group', icon: 'https://testicons.com/testicon.png', user_id: test_user.id)
    expect(ev.persisted?).to eql(true)
  end
end
