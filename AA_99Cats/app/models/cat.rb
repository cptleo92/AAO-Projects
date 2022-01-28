require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  
  COLORS = ["black", "white", "brown", "yellow"]

  validates :name, :color, :birth_date, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS, 
    message: "invalid color"}
  validates :sex, inclusion: { in: ['M', 'F'] }

  def age
    time_ago_in_words(self.birth_date)
  end 
end