class AnswersController < ApplicationController
  include Broadcastable

  def answer
    @participation = Participation.find(params[:id])
    @answer = Answer.find(params[:answer_id])
    @game = @participation.game


    if @answer.correct?
      # increment question_number
      # on display la nouvelle question
      @game.question_number += 1
      @game.save
      puts @game.current_question.content
      broadcast_question
    else
      puts "incorrect"
    end
  end
end
