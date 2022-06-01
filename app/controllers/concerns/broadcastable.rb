module Broadcastable
  def broadcast_players_list
    Turbo::StreamsChannel.broadcast_update_to @game,
      target: "players",
      partial: "games/players",
      locals: {
        players: @game.players,
        game: @game
      }
  end

  def broadcast_question
    Turbo::StreamsChannel.broadcast_append_to @game,
      target: "question",
      locals: {
        questions: @game.questions,
        game: @game
      }
  end
end
