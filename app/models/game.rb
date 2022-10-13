class Game < ApplicationRecord
  belongs_to :user

  has_many :participations, dependent: :destroy
  has_many :players, through: :participations, source: :user
  has_many :game_questions, dependent: :destroy
  has_many :questions, through: :game_questions

  def current_question
    self.questions[self.question_number]
  end

  def previous_question
    self.questions[self.question_number - 1]
  end

  def players_ready?
    participations.map(&:ready).all?
  end

  def started?
    status == "running"
  end

  def ended?
    status == "ended"
  end

  def current_attempts
    current_question.game_questions.where(game: self).flat_map(&:attempts)
  end

  def previous_attempts
    previous_question.game_questions.where(game: self).flat_map(&:attempts)
  end

  def all_attempts_false
    current_attempts.all? { |at| at.success == false } && current_attempts.count == participations.count
  end

  def any_attempts_correct?
    current_attempts.any?(&:succes)
  end

  def incorrect_attempt?(participation)
    current_attempts.flat_map(&:participation).include?(participation)
  end
end
