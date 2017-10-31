require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # new, create
  describe 'GET #new' do
    it 'renders the new user form page' do
      get :new, params: { users: {} }

      expect(response).to render_template('new')
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'when given good params' do
      subject(:waffles) {User.find_by_credentials('waffles','hello_world')}
        before(:each) do
          post :create, params: { user: {username: 'waffles', password: 'hello_world'} }
        end

      it 'logs in the user' do
        expect(session[:session_token]).to eq(waffles.session_token)
      end

      it 'redirects to user\'s show page' do
        expect(response).to redirect_to(user_url(waffles))
      end
    end

    context 'when given bad params' do
      before(:each) do
        post :create, params: { user: {username: 'waffles', password: ' '} }
      end

      it "flashes errors" do
        expect(flash[:errors]).to be_present
      end

      it "redirects to sign up form" do
        expect(response).to render_template('new')
      end


    end

  end
end
