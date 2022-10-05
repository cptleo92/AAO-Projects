class Bench < ApplicationRecord
  validates :description, :lat, :lng, :seating, presence: true
  validates :lat, :lng, :seating, numericality: true

  def self.in_bounds(bounds)
    return Bench.all if bounds.nil?
    south = bounds["south"]
    north = bounds["north"]
    east = bounds["east"]
    west = bounds["west"]
    Bench.where(["lat < ? and lng < ? and lat > ? and lng > ?", 
      north,
      east,
      south,
      west
    ])    
  end

end
