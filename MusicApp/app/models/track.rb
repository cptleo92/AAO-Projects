class Track < ApplicationRecord
  validates :title, :ord, :band_id, :album_id, presence: true
  validates :bonus, inclusion: { in: [true, false] }
  validates :ord, uniqueness: { scope: :album_id,
    message: "should not repeat within an album"}

  belongs_to :album
  belongs_to :band

end
