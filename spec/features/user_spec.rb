require 'rails_helper'

RSpec.describe 'Sign Up' do
  let(:user) { User.create(Username: 'Foo Bar', Email: 'foo@bar.com', Password: '12345678') }

  scenario 'Sign up ' do
    visit new_user_registration_path
    fill_in 'Username', with: 'Foo Bar'
    fill_in 'Email', with: 'foo@bar.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'
    sleep(3)
    visit root_path
    expect(page).to have_content('Foo Bar')
  end

  scenario 'Sign up absard inputs' do
    visit new_user_registration_path
    fill_in 'Username', with: ''
    fill_in 'Email', with: 'foo@bar.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'
    sleep(3)
    visit root_path
    expect(page).to_not have_content('Foo Bar')
  end
end

RSpec.describe 'Sign In', type: :feature do
  let(:user) { User.create(username: 'Foo Bar', email: 'foo@bar.com', password: '12345678') }
  scenario 'Log in ' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(3)
    visit root_path
    expect(page).to have_content('Foo Bar')
  end

  scenario 'Log in with invalid inputs' do
    visit new_user_session_path
    fill_in 'Email', with: 'xyz'
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(3)
    expect(page).to_not have_content('Foo Bar')
  end
end

RSpec.describe 'Log Out', type: :feature do
  let(:user) { User.create(username: 'Foo Bar', email: 'foo@bar.com', password: '12345678') }
  scenario 'Log Out' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(8)
    click_on 'sign out'
    sleep(3)
    visit root_path
    expect(page).to have_content('')
  end
end
