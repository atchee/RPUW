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
      # TimerJob.set(wait: 3.second).perform_later(@game.id)
      # while @game.question_number < 20
#             @game.question_number += 1
#             @game.save
#             TimerJob.set(wait: 3.second).perform_later(@game.id)
            # sleep 3
            # broadcast_question
      # end

    #  @game.timer
  end

  def broadcast_answer
    Turbo::StreamsChannel.broadcast_update_to @game,
      target: "answer",
      partial: "games/answer",
      locals: {
        question: @game.current_question
      }
  end

  def broadcast_desk
    Turbo::StreamsChannel.broadcast_update_to @game,
      target: "participation_#{@participation.id}",
      partial: "games/desk",
      locals: {
        participation: @participation
      }
  end

  def broadcast_scores
    Turbo::StreamsChannel.broadcast_update_to @game,
      target: "scores",
      partial: "games/scores",
      locals: {
        participations: @game.participations,
        attempts: @attempts,
        looser: @looser
      }
  end

  def broadcast_summary
    Turbo::StreamsChannel.broadcast_update_to @game,
      target: "summary",
      partial: "games/summary",
      locals: {
        participations: @game.participations,
        looser: @looser
      }
  end

  def broadcast_remove_question
    Turbo::StreamsChannel.broadcast_remove_to @game,
      target: "question"
  end

  def broadcast_remove_scores
    Turbo::StreamsChannel.broadcast_remove_to @game,
      target: "scores"
  end

  def broadcast_timer
    Turbo::StreamsChannel.broadcast_update_to @game,
      target: "timer",
      partial: "games/timer",
      locals: {
        game: @game
      }
  end
end
