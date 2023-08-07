require 'rails_helper'

RSpec.describe Challenge, type: :model do
  describe 'associations' do
    it { should belong_to(:keyword) }
    it { should belong_to(:user) }
    it { should have_one(:post) }
  end

  describe 'validations' do
    it { should validate_presence_of(:keyword_id) }
    it { should validate_presence_of(:user_id) }
  end
end
