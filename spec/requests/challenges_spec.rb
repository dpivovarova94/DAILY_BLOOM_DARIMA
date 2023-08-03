require 'rails_helper'


RSpec.describe "Challenges", type: :request do
  describe 'GET #new' do
    context 'when challenge of today exists for current user' do
      let(:user) { User.create(email: "rose@bloom.com", password: "123456") }
      let(:challenge) { Challenge.create(user: user, created_at: Time.current.all_day) }

      before do
        sign_in(user)
        get new_challenge_path
      end

      it 'redirects to the existing challenge' do
        expect(response).to redirect_to(challenge_path(challenge))
      end
    end

    context 'when challenge of today does not exist for current user' do
      let(:user) { User.create(email: "rose@bloom.com", password: "123456") }
      let(:keyword) { Keyword.create(name: "People", category: "Human Connection") }

      before do
        sign_in(user)
        allow(Keyword).to receive_message_chain(:where, :sample).and_return(keyword)
        get new_challenge_path
      end

      it 'assigns a new challenge' do
        expect(assigns(:challenge)).to be_a_new(Challenge)
      end

      it 'assigns the current user to @user' do
        expect(assigns(:user)).to eq(user)
      end

      it 'assigns a random keyword to @keyword' do
        expect(assigns(:keyword)).to eq(keyword)
      end

      it 'renders the :new template' do
        expect(response).to render_template(:new)
      end
    end
  end
end
