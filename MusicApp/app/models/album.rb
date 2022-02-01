class Album < ApplicationRecord
  validates :title, :band_id, presence: true
  validates :studio, inclusion: { in: [true, false] }
  validates :year, numericality: { greater_than: 1900, less_than: 2030, allow_nil: true}

  belongs_to :band

end
