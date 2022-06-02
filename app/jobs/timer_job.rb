class TimerJob < ApplicationJob
  include Broadcastable
  queue_as :default
  sidekiq_options retry: false

  def perform(*args)
    @game = Game.find(args[0])
    broadcast_question
  end
end
