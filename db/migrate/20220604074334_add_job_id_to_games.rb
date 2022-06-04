class AddJobIdToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :job_id, :string
  end
end
