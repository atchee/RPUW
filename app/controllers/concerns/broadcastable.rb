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

  def broadcast_question
    Turbo::StreamsChannel.broadcast_update_to @game,
      target: "game",
      partial: "games/question",
      locals: {
        question: @game.current_question
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
