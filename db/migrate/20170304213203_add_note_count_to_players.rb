class AddNoteCountToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :notes_count, :integer
  end
end
