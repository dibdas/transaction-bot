require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'associations' do
    it { should belong_to(:group).optional }
    it { should belong_to(:user) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
  end
end
