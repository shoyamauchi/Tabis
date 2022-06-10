class Add3columnsToTabis < ActiveRecord::Migration[6.1]
  def change
    add_column :tabis, :route_info, :boolean
    add_column :tabis, :covid_info, :boolean
    add_column :tabis, :start_date, :date
  end
end
