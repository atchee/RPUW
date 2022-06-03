class AddSuccessToAttempts < ActiveRecord::Migration[7.0]
  def change
    add_column :attempts, :success, :boolean
  end
end
