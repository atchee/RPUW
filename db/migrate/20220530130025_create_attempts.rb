class CreateAttempts < ActiveRecord::Migration[7.0]
  def change
    create_table :attempts do |t|
      t.references :participation, null: false, foreign_key: true
      t.references :game_question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
