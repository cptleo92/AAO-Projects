class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates :artist_id, uniqueness: { scope: :title,
    message: "should not have duplicate titles"}

  belongs_to :artist,
    class_name: 'User',
    foreign_key: :artist_id

  has_many :comments,
    dependent: :destroy  

  has_many :likes, as: :likeable

  has_many :artwork_shares
    
  has_many :shared_viewers, through: :artwork_shares, source: :viewers


end 