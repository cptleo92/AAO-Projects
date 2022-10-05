require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  subject(:user) do
    User.create!(
    email: "jill_bruce",
    password: "password")
  end

  describe 'GET #new' do
    it "renders the new user page" do
      get :new
      expect(response).to render_template(:new)
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with invalid params' do
      it "redirects to the new user page" do
        post :create, params: { user: { email: 'test', password: 'short' } }
        expect(response).to render_template(:new)
      end

      it "shows an error message" do
        post :create, params: { user: { email: 'test', password: 'short' } }
        expect(flash[:errors]).to be_present
      end
    end

    context 'with valid params' do
      it "renders the show user page" do
        post :create, params: { user: { email: 'jill_bruce', password: 'password' } }
        expect(response).to redirect_to(user_url(User.find_by(email: 'jill_bruce')))
      end

      it "logs the user in"
    end
  end

  describe 'GET #show' do
    it "renders the show user page" do  
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
    
  end


end
