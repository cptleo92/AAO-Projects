class Vote < ApplicationRecord
  validates :value, inclusion: [1, -1]

  belongs_to :voteable, polymorphic: true  
end