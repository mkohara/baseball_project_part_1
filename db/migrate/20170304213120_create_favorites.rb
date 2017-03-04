class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :scout_id
      t.integer :player_id
      t.string :name

      t.timestamps

    end
  end
end
