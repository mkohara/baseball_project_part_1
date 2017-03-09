class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :divison_league
      t.string :schedule
      t.string :when_play
      t.integer :location_id

      t.timestamps

    end
  end
end
