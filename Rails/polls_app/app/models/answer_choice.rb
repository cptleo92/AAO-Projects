class AnswerChoice < ApplicationRecord
  validates :text, presence: true

  belongs_to :question

  has_many :responses,
    class_name: 'Response',
    foreign_key: :answer_id,
    primary_key: :id    

end