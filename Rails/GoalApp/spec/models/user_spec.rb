require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.create(:user) }

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_hash) }  
    it { should validate_length_of(:password).is_at_least(6) }  
    it { should validate_uniqueness_of(:email) }
  end

  describe "associations" do
    it { should have_many(:goals) }
  end

  describe "methods" do   
    describe "#is_password?" do
      it "should return true if arg is correct password" do
        expect(user.is_password?("password")).to be true
      end
      it "should return false if arg is wrong password" do
        expect(user.is_password?("potato")).to be false
      end
    end

    describe "::find_by_credentials" do
      context "with valid creds" do
        it "should return user with the right login info" do
          right = User.create(email: 'email', password: 'password')
          expect(User.find_by_credentials('email', 'password')).to eq(right)
        end
      end    

      context "with invalid creds" do
        it "should return nil" do
          expect(User.find_by_credentials('email', 'pasword')).to be(nil)
        end
      end
    end  
    
    describe "#reset_session_token!" do
      # let!(:user) { FactoryBot.create(:user) }
      it "should generate new session token" do
        old_token = user.session_token
        user.reset_session_token!
        expect(user.session_token).to_not eq(old_token)
      end

      it "should return session token" do
        expect(user.reset_session_token!).to eq(user.session_token)
      end   
    end
  end  

end
