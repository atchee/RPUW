class GamesController < ApplicationController
  include Broadcastable

  def show
    @game = Game.find(params[:id])

    unless @game.players.include?(current_user)
      Participation.create(user: current_user, game: @game, ready: false)
    end

    broadcast_players_list
  end

  def create
    @game = Game.new(user: current_user)
    @game.questions = Question.all.sample(20)
    @game.save

    redirect_to game_path(@game)
  end

  def start
    @game = Game.find(params[:id])
    @game.update(status: 'running')

    broadcast_remove_players_list
    broadcast_question
    broadcast_scores
  end

  # def end
  #   @game = Game.find(params[:id])
  #   @game.update(status: 'ended')
  #   broadcast_summary
  # end

  # def next_question
  # end
end
