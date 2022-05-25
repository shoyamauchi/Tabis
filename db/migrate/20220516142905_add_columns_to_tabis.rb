class AddColumnsToTabis < ActiveRecord::Migration[6.1]
  def change
    add_column :tabis, :address, :string
    add_column :tabis, :latitude, :float
    add_column :tabis, :longitude, :float
  end
end
