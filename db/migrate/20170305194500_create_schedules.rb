class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :location_id
      t.datetime :event_date

      t.timestamps

    end
  end
end
