require 'rails_helper'

RSpec.describe Account, type: :model do
  test_user = User.create!(username: 'berny', email: 'z1@gmail.com', password: 'hsjitygj067')
  test_group = test_user.groups.create!(name: 'test_group')
  test_transaction = Account.create!(name: 'test_transaction', amount: 100, user_id: test_user.id,
                                     group_id: test_group.id)

  it 'should fail to create a transaction without amount' do
    ev = Account.create(name: 'test event')
    expect(ev.persisted?).to eql(false)
  end

  it 'should fail to create a transaction without name' do
    ev = Account.create(amount: 200)
    expect(ev.persisted?).to eql(false)
  end

  it 'should fail to create a transaction without user' do
    ev = Account.create(name: 'test event', amount: 100, group_id: test_group.id)
    expect(ev.persisted?).to eql(false)
  end

  it 'should be saved with all users' do
    ev = Account.create(name: 'test event', amount: 100, user_id: test_user.id, group_id: test_group.id)
    expect(ev.persisted?).to eql(true)
  end
end
