# == Schema Information
#
# Table name: tags
#
#  id   :bigint           not null, primary key
#  name :string           not null
#
class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :taggings  
  has_many :todos, through: :taggings
end
