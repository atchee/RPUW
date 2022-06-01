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
    @game = Game.new
    @game.questions = Question.all.sample(20)
    @game.save

    redirect_to game_path(@game)
  end

  def start_game
    respond_to do |format|
      format.turbo_stream { "toto" }
    end
  end
  # creer la route post "games#start_game"
  # find une question parmi @game.questions
  # display une question de l'array à l'utilisateur
  # display les réponses à l'utilisateur
  # l'utilisateur selectionne une réponse
  # on vérifie la bonne / mauvaise réponse
  # on affiche la prochaine question


  #réponse aux questions :
  # si l'user clique sur une réponse "incorrecte" => broadcast aux autres qu'il s'est trompé
  # si l'user clique sur une réponse "correcte" => broadcast aux autres que Michel a bien répondu et on affiche la prochaine question.
end
