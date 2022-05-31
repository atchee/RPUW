class ParticipationsController < ApplicationController
  include Broadcastable

  # def ready_to_start
  #   Participation.ready == true
  # end

  def ready
    @game = Game.find(params[:id])

    user = Participation.find(params[:id])
    user.toggle!(:ready)

    broadcast_players_list
  end
end
