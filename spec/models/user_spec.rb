RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:groups) }

    it { should have_many(:accounts) }
  end
end
