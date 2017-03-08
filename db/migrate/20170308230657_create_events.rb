class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :location_id
      t.datetime :held_at

      t.timestamps

    end
  end
end
