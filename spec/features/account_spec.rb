require 'rails_helper'
RSpec.describe 'Create new Expense', type: :feature do
  let(:user) { User.create(username: 'Foo Bar', email: 'foo@bar.com', password: '12345678') }
  scenario 'Create Expense' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    click_on 'accounts'
    click_on 'New Transaction'
    fill_in 'Name', with: 'Bargh'

    fill_in 'Amount', with: 123.45
    click_on 'submit'
    visit external_transaction_path
    expect(page).to have_content('Bargh')
  end
  scenario 'Create Expense with invalid inputs ' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    click_on 'accounts'
    click_on 'New Transaction'
    fill_in 'Name', with: ' '

    fill_in 'Amount', with: ' '
    click_on 'submit'

    expect(page).to_not have_content('Bargh')
  end
end
