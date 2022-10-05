class Response < ApplicationRecord
  validate :not_duplicate_response, :cannot_answer_own_poll
  
  belongs_to :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id 

  belongs_to :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_id,
    primary_key: :id

  has_one :question,
  through: :answer_choice,
  source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def response_already_answered?
    self.sibling_responses.exists?(user_id: respondent.id)
  end

  def not_duplicate_response
    if response_already_answered?
      errors[:question] << 'has already been answered by this username'
    end 
  end

  def authored_own_poll?
    self.respondent.authored_polls.exists?(self.question.poll.id)
  end

  def cannot_answer_own_poll
    if authored_own_poll?
      errors[:poll] << 'cannot be answered by tue author'
    end
  end
end