require 'rails_helper'
require 'spec_helper'

RSpec.describe "Challenges", type: :request do
  describe 'GET #new' do
    context 'when challenge of today exists for current user' do
      let(:user) { User.create(email: "rose@bloom.com", password: "123456") }
      let(:category) { Category.create(name: "Food") }
      let(:keyword) { Keyword.create(name: "Pizza", category: category) }
      let!(:challenge) { Challenge.create(user: user, created_at: Time.current, keyword: keyword) }

      before do
        sign_in(user) # Using Devise test helper to sign in the user
        # get new_challenge_path
      end

      it 'redirects to the existing challenge' do
        get new_challenge_path
        expect(response).to redirect_to(challenge_path(challenge))
      end
    end

    context 'when challenge of today does not exist for current user' do
      it 'renders the new template' do
        get new_challenge_path
        expect(response).to render_template(:new)
      end
    end
  end
end
