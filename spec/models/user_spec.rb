require 'rails_helper'

RSpec.describe User, type: :model do
  test_user = User.create!(username: 'aberrd', email: '2d@example.com', password: 'jshjkhh0178')

  it 'should fail to create account without name' do
    ev = User.create(email: 'b@example.com', password: 'hsjoarty067')
    expect(ev.persisted?).to eql(false)
  end

  it 'should fail to create account without email' do
    ev = User.create(username: 'bernard rozario', email: 'c@gmail.com')
    expect(ev.persisted?).to eql(false)
  end

  it 'should fail to create account without password' do
    ev = User.create(username: 'bernard rozario', email: 'c@gmail.com')
    expect(ev.persisted?).to eql(false)
  end
end
