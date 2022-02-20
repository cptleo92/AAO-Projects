class Like < ApplicationRecord
  validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: [:likeable_id, :likeable_type],
    message: "can only be liked once per user"}

  belongs_to :likeable, polymorphic: true
  belongs_to :user
end