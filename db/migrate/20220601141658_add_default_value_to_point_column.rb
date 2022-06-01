class AddDefaultValueToPointColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :participations, :point, :integer, default: 0
  end
end
