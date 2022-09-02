class CreateUserTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :user_trips do |t|
      t.integer :user_id
      t.integer :trip_id
      t.boolean :owner, default: false

      t.timestamps
    end
  end
end
