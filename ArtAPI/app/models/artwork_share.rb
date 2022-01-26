class ArtworkShare < ApplicationRecord
  validates :viewer_id, :artwork_id, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id,
    message: "can only be shared once per viewer"}

  belongs_to :viewers,
    class_name: 'User',
    foreign_key: :viewer_id

  belongs_to :artworks,
    class_name: 'Artwork',
    foreign_key: :artwork_id
end