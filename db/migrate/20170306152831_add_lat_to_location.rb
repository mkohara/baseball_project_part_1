class AddLatToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :lat, :string
  end
end
