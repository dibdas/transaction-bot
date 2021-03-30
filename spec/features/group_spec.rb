require 'rails_helper'

RSpec.describe 'Create group' do
  let(:group) { Group.create(name: 'Bar', icon: 'hjgkgbkjl', user_id: user.id) }

  scenario '' do
 
    visit new_group_path

    click_on 'New Group'

    fill_in 'Name', with: 'Bar'
    fill_in 'Icon',  with: 'hjgkgbkjl'

    click_on 'Create Group'
    sleep(3)
    visit  groups_path
    expect(page).to have_content('Foo Bar')
  end

end
