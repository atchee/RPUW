class AddDefaultNumberToGames < ActiveRecord::Migration[7.0]
  def change
    change_column :games, :question_number, :integer, default: 0
  end
end
