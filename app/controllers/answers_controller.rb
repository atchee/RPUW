class AnswersController < ApplicationController
  include Broadcastable

  def answer
    @participation = Participation.find(params[:id])
    @answer = Answer.find(params[:answer_id])
    @game = @participation.game

    if @answer.correct?
      @game.question_number += 1 if @game.current_attempts.select { |at| at.success }.empty?
      @game.save
      @score = @participation.point += @answer.question.point_value
      @participation.update(point: @score)
      attempt_record(true)
      @looser = false

      if winner?
        @winner = @participation.user
        @game.update(status: "ended")
        broadcast_summary
        broadcast_remove_question
        broadcast_remove_scores
        broadcast_remove_timer
      else
        broadcast_answer
        broadcast_pause_timer
        broadcast_desk

        sleep 2 # To get time to see the broadcasted score
        broadcast_timer
        broadcast_question
        broadcast_others_desk
      end
    else
      attempt_record(false)
      @looser = @participation.user
      # broadcast_scores
      broadcast_desk
      if @game.all_attempts_false
        broadcast_answer
        sleep 2 # To get time to see the broadcasted score
        @game.question_number += 1
        @game.save
        # broadcast_desk
        broadcast_scores

        broadcast_question
        broadcast_timer
      end
      @game.update(status: "ended") if @game.question_number == @game.questions.count
    end
  end

  def winner?
    @score >= 9
  end

  private

  def attempt_record(attempt)
    game_question = @answer.question.game_questions.find_by(game: @game)
    Attempt.create(participation: @participation, game_question: game_question, success: attempt)
  end
end
