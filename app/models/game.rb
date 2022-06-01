class Game < ApplicationRecord
  belongs_to :user

  has_many :participations
  has_many :players, through: :participations, source: :user
  has_many :game_questions
  has_many :questions, through: :game_questions

  def current_question
    self.questions[self.question_number]
    # array        # integer
  end

  def players_ready?
    participations.map(&:ready).all?
  end

  def started?
    status == "running"
  end

end
