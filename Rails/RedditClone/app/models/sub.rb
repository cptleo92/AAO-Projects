class Sub < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, :moderator_id, presence: true
  validates :title, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  belongs_to :moderator,
    class_name: 'User',
    foreign_key: :moderator_id

  has_many :post_subs, dependent: :destroy, inverse_of: :sub
  has_many :posts, through: :post_subs    
end