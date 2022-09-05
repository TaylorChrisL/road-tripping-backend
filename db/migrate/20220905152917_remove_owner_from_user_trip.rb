class RemoveOwnerFromUserTrip < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_trips, :owner, :boolean
  end
end
