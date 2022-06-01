class ParticipationsController < ApplicationController
  include Broadcastable

  # def ready_to_start
  #   Participation.ready == true
  # end

  def ready
    participation = Participation.find(params[:id])
    participation.toggle!(:ready)
    @game = participation.game

    broadcast_players_list
  end

  def answer
    # raise
  end
end
