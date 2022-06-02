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
      @looser = false

      broadcast_question
      broadcast_scores
    else
      @looser = @participation.user
      # alert: "mauvaise réponse"
      broadcast_scores
    end
  end
end
