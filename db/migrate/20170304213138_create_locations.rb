class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :field
      t.string :name
      t.text :details
      t.string :address

      t.timestamps

    end
  end
end
