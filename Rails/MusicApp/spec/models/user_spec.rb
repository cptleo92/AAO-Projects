require 'rails_helper'

RSpec.describe User, type: :model do
  # subject(:user) { User.create!(email: 'test', password: 'password') }

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_hash) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "methods" do
    let!(:user) { User.create!(email: 'test', password: 'password') } 

    describe "#is_password?" do
      it "should be true if hash of password matches password_hash" do
        expect(user.is_password?('password')).to be(true)
      end
      it "should be false if hash of password does not match password_hash" do
        expect(user.is_password?('passwor')).to be(false)
      end
    end

    describe "#reset_session_token!" do
      it "should generate new session token" do
        old_token = user.session_token
        user.reset_session_token!
        expect(old_token).to_not be(user.session_token)
      end
    end

    describe "::find_by_credentials" do
      context "creds are valid" do
        it "should return user object" do
          expect(User.find_by_credentials('test','password')).to eq(user)
        end
      end

      context "creds are invalid" do
        it "should return nil" do
          expect(User.find_by_credentials('test','pasesword')).to be(nil)
        end
      end
    end

  end
end
