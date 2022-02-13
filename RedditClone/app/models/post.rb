class Post < ApplicationRecord
  validates :title, :author_id, presence: true

  belongs_to :author,
    class_name: 'User',
    foreign_key: :author_id

  has_many :comments,
    dependent: :destroy

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs

end