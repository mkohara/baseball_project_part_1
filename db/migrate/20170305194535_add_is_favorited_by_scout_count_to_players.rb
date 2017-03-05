class AddIsFavoritedByScoutCountToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :is_favorited_by_scout_count, :integer
  end
end
