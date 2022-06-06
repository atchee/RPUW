class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def correct_answer?
    game.current_attempts.find { |attempt| attempt.success }&.participation == self
  end

  def last_attempt_correct?
    attempts.last&.success
  end
end
