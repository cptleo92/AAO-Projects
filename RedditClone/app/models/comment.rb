class Comment < ApplicationRecord
  validates :content, :author_id, :post_id, presence: true
  validates :author_id, uniqueness: { scope: :post_id }

  belongs_to :author,
    class_name: 'User',
    foreign_key: :author_id

  belongs_to :post

end
