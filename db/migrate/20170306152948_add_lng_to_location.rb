class AddLngToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :lng, :string
  end
end
