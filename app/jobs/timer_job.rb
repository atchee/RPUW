class TimerJob < ApplicationJob
  include Broadcastable
  queue_as :default
  sidekiq_options retry: false

  def perform(*args)
    @game = Game.find(args[0])

    unless @game.any_attempts_correct?
      @game.question_number += 1
      @game.save
      broadcast_question
      broadcast_timer
      TimerJob.set(wait: 10.seconds).perform_later(@game.id)
    end
  end
end
