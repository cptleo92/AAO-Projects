class Question < ApplicationRecord
  validates :text, presence: true, uniqueness: true

  belongs_to :poll,
    class_name: 'Poll',
    foreign_key: :poll_id,
    primary_key: :id  

  has_many :answerchoices,
    class_name: 'AnswerChoice',
    foreign_key: :question_id,
    primary_key: :id,
    dependent: :destroy    

end