class Game < ApplicationRecord
  belongs_to :user

  has_many :participations, dependent: :destroy
  has_many :players, through: :participations, source: :user
  has_many :game_questions, dependent: :destroy
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

  def ended?
    status == "ended"
  end

  def current_attempts
    current_question.game_questions.where(game: self).flat_map(&:attempts)
  end

  def all_attempts_false
    p "============"
    p current_attempts
    current_attempts.all? { |at| at.success == false } && current_attempts.count == 4
  end

  def any_attempts_correct?
    current_attempts.any?(&:succes)
  end

  # def timer
  #   while @game.question_number < 20
  #     @game.question_number += 1
  #     @game.save
  #     TimerJob.set(wait: 3.second).perform_later(@game.id)
  #     # sleep 3
  #     # broadcast_question
  #   end
  #   # broadcast_question
  #   # broadcast_scores
  # end

end
