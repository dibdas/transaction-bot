FactoryBot.define do
  factory :user do
    username { 'Joe' }
    email { 'joe@gmail.com' }
    password { 'blah123' }
  end
end
