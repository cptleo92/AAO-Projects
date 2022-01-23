class AnswerChoice < ApplicationRecord
  validates: :text, presence: true, uniqueness: true

  belongs_to :question
  has_many :responses

end