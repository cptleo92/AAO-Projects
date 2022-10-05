module Voteable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable
  end

  def vote(value)
    self.votes.create!(value: value)
  end

  def score   
    score = 0
    self.votes.each do |vote|
      score += vote.value
    end
    score
  end

end