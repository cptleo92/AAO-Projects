require 'rails_helper'

RSpec.describe Goal, type: :model do
  subject(:test_goal) { FactoryBot.build(:goal) }

  describe "validations" do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:user_id) }
    it { should validate_inclusion_of(:public?).in_array([true, false])}
    it { should validate_uniqueness_of(:user_id).scoped_to(:description).with_message('can\'t have the same goal twice') }
  end

  describe "associations" do
    it { should belong_to(:user) }
  end

  
end
