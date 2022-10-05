class Goal < ApplicationRecord
  validates :description, :user_id, presence: true
  validates :public?, inclusion: [true, false] 
  validates :user_id, uniqueness: { scope: :description, message: "can't have the same goal twice" }

  belongs_to :user, inverse_of: :goals
end
