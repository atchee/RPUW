module Broadcastable
  def broadcast_players_list
    @game.players.each do |player|
      Turbo::StreamsChannel.broadcast_update_to player,
        target: "players",
        partial: "games/players",
        locals: {
          players: @game.players,
          game: @game,
          user: player
        }
    end
  end

  def broadcast_remove_players_list
    Turbo::StreamsChannel.broadcast_remove_to @game,
      target: "players"
  end

  def broadcast_question
    Turbo::StreamsChannel.broadcast_update_to @game,
      target: "question",
      partial: "games/question",
      locals: {
        question: @game.current_question
      }
  end

  def broadcast_scores
    Turbo::StreamsChannel.broadcast_update_to @game,
      target: "scores",
      partial: "games/scores",
      locals: {
        participations: @game.participations,
        looser: @user
      }
  end
end
