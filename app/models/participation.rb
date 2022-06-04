class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :game

  has_many :attempts, dependent: :destroy

  def correct_answer?
    game.previous_attempts.find { |at| at.success }&.participation == self
  end

  def last_attempt_correct?
    attempts.last&.success
  end
end
