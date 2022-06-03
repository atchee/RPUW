class AnswersController < ApplicationController
  include Broadcastable

  def answer
    @participation = Participation.find(params[:id])
    @answer = Answer.find(params[:answer_id])
    @game = @participation.game

    if @answer.correct?
      @game.question_number += 1
      @game.save
      @score = @participation.point += 1
      @participation.update(point: @score)
      attempt_record(true)
      @looser = false

      # TimerJob.set(wait: 10.second).perform_later(@game.id)


      # TimerJob.set(wait: 10.second).perform_later(@game.id)
      # broadcast_question
      # broadcast_scores
      if winner?
        @winner = @participation.user
        @game.update(status: "ended")
        broadcast_summary
        broadcast_remove_question
        broadcast_remove_scores
      else
        broadcast_question
        broadcast_scores
      end
    else
      attempt_record(false)
      @looser = @participation.user

      # alert: "mauvaise réponse"
      # broadcast_scores
      if @game.all_attempts_false
        @game.question_number += 1
        @game.save
        broadcast_question
      end
      broadcast_scores
    end
  end

  def winner?
    @score == 9
  end

  private

  def attempt_record(attempt)
    game_question = @answer.question.game_questions.find_by(game: @game)
    Attempt.create(participation: @participation, game_question: game_question, success: attempt)
  end
end
