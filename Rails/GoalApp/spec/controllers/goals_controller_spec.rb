require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let(:user) { User.create!(email: 'test', password: 'password') }

  before(:each) do
    allow_message_expectations_on_nil
  end

  describe "GET #new" do
    context "when logged in" do
      before do
        allow(controller).to receive(:current_user) {user}
      end

      it "renders the new goal page" do
        get :new
        expect(response).to render_template('new')
        expect(response).to have_http_status(:success)
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) {nil}
      end

      it "redirects to the login page" do
        get :new
        expect(response).to redirect_to(new_sessions_url)
      end
    end
  end

  describe "POST #create" do
    context "when logged in" do
      before do
        allow(controller).to receive(:current_user) {user}
      end

      context "with valid params" do
          it "redirects to latest goal page" do
          post :create, params: { goal: { description: 'eat a cake' } }
          expect(response).to redirect_to(goal_url(Goal.last))
        end
      end

      context "with invalid params" do
        it "renders the same page with errors" do
          post :create, params: { goal: { description: "" } }
          expect(response).to render_template(:new)
          expect(flash[:errors]).to be_present
        end
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) {nil}
      end

      it "redirects to the login page" do
        post :create, params: { goal: {} }
        expect(response).to redirect_to(new_sessions_url)
      end
    end  
  end
end

