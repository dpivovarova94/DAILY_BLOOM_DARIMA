require 'rails_helper'


RSpec.describe "Challenges", type: :request do
  describe 'GET #new' do
    context 'when challenge of today exists for current user' do
      let(:user) { User.create(email: "rose@bloom.com", password: "123456") }
      let(:challenge) { Challenge.create(user: user, created_at: Time.current.all_day) }

      # before do
      #   sign_in(user)
      #   get new_challenge_path
      # end

      it 'redirects to the existing challenge' do
        expect(response).to redirect_to(challenge_path(challenge))
      end
    end
  end
end
