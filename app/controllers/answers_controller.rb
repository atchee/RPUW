class AnswersController < ApplicationController
  include Broadcastable

  def answer
    @participation = Participation.find(params[:id])
    @answer = Answer.find(params[:answer_id])
    @game = @participation.game
    @user = @participation.user

    if @answer.correct?
      @game.question_number += 1
      @game.save
      @score = @participation.point += 1
      @participation.update(point: @score)
      broadcast_question
      broadcast_scores
    else
      # alert: "mauvaise réponse"
      broadcast_scores
    end
  end
end
