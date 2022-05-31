class ParticipationsController < ApplicationController
  include Broadcastable

  def ready_to_start
    Participation.ready == true
  end

  def ready
    user = Participation.find(params[:id])
    user.toggle!(:ready)
  end

  def answer
    # raise

  end
end
