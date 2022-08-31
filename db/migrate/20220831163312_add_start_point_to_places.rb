class AddStartPointToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :places, :start_point, :boolean, default: false
    add_column :places, :end_point, :boolean, default: false
  end
end
