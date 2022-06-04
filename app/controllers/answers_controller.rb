class AnswersController < ApplicationController
  include Broadcastable

  def answer
    @participation = Participation.find(params[:id])
    @answer = Answer.find(params[:answer_id])
    @game = @participation.game

    if @answer.correct?
      correct_answer

      if winner?
        end_game
      else
        broadcast_answer
        broadcast_scores
        broadcast_desk
        @game.question_number += 1
        @game.save
        sleep 2
        broadcast_remove_answer
        broadcast_question
        broadcast_timer
      end

    else
      attempt_record(false)
      @looser = @participation.user
      broadcast_scores
      broadcast_desk

      if @game.all_attempts_false
        @correct_answer = @game.current_question.correct_answer
        @game.question_number += 1
        @game.save
        broadcast_answer
        sleep 2
        broadcast_remove_answer
        broadcast_question
        broadcast_scores
        broadcast_timer
      end
    end
  end

  def winner?
    @score == 9
  end

  private

  def correct_answer
    @score = @participation.point += 1
    @participation.update(point: @score)
    attempt_record(true)
    @looser = false
  end

  def end_game
    @winner = @participation.user
    @game.update(status: "ended")
    broadcast_summary
    broadcast_remove_question
    broadcast_remove_scores
  end

  def attempt_record(attempt)
    game_question = @answer.question.game_questions.find_by(game: @game)
    Attempt.create(participation: @participation, game_question: game_question, success: attempt)
  end
end
