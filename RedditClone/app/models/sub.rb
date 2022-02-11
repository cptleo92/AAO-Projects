class Sub < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, :moderator_id, presence: true
  validates :title, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  has_many :posts,
    dependent: :destroy

  belongs_to :moderator,
    class_name: 'User',
    foreign_key: :moderator_id
end