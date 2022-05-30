class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :status
      t.integer :question_number
      t.integer :round

      t.timestamps
    end
  end
end
