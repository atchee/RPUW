class RenameQuestionsIdToQuestionId < ActiveRecord::Migration[7.0]
  def change
    rename_column :game_questions, :questions_id, :question_id
  end
end
