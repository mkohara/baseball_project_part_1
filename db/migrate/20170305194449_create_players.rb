class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :scout_id
      t.integer :team_id
      t.string :name
      t.date :dob
      t.string :position

      t.timestamps

    end
  end
end
