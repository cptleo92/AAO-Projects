class Post < ApplicationRecord
  include Voteable

  validates :title, :author_id, presence: true

  belongs_to :author,
    class_name: 'User',
    foreign_key: :author_id

  has_many :comments,
    dependent: :destroy

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs

  def comments_by_parent_id
    comments_by_id_hash = {}
    self.comments.each do |comment|
      parent_id = comment.parent_comment_id
      comments_by_id_hash[parent_id] = Comment.where(parent_comment_id: parent_id).includes(:author)
    end
    comments_by_id_hash
  end
end