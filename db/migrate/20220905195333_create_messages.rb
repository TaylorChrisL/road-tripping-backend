class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :sender
      t.string :message
      t.integer :trip_id

      t.timestamps
    end
  end
end
