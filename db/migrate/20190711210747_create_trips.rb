class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.timestamp :start
      t.timestamp :finish
      t.integer :quota
      t.references :start_place
      t.references :finish_place
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_foreign_key :trips, :places, column: :start_place, primary_key: :id
    add_foreign_key :trips, :places, column: :finish_place, primary_key: :id
  end
end
