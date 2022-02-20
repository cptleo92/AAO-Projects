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

  has_many :responses,
    through: :answerchoices,
    source: :responses

  def results
    # N+1
    # ---
    # results = {}
    # self.answerchoices.each do |choices|
    #   results[choices.text] = choices.responses.count
    # end
    # results

    # answers = self.answerchoices.includes(:responses)
    # results = {}
    # answers.each do |choices|
    #   results[choices.text] = choices.responses.length
    # end
    # results

    acs = self.answerchoices    
      .select('answer_choices.text, COUNT(responses.id) AS num_responses')
      .left_outer_joins(:responses)
      .group('answer_choices.text')

    results = {}
    acs.each { |a| results[a.text] = a.num_responses }
    results
    
  end

end