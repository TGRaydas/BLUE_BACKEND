class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.string :state
      t.references :user1
      t.references :user2

      t.timestamps
    end
    add_foreign_key :friends, :users, column: :user1_id, primary_key: :id
    add_foreign_key :friends, :users, column: :user2_id, primary_key: :id
  end
end
