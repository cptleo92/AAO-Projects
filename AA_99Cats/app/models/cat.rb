require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  
  COLORS = %w(Black Chocolate Cinnamon Blue Lilac Cream Caramel)

  validates :name, :color, :birth_date, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS, 
    message: "invalid color"}
  validates :sex, inclusion: { in: ['M', 'F'] }

  def age
    time_ago_in_words(self.birth_date)
  end 
end