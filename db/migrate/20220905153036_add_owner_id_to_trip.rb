class AddOwnerIdToTrip < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :owner_id, :integer
  end
end
