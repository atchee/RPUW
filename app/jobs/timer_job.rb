class TimerJob < ApplicationJob
  include Broadcastable
  queue_as :default
  sidekiq_options retry: false

  def perform(*args)
    @game = Game.find(args[0])
    if @game.current_question
    sleep 3
    broadcast_question

  end
end
