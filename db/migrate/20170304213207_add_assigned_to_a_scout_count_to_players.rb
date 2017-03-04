class AddAssignedToAScoutCountToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :assigned_to_a_scout_count, :integer
  end
end
