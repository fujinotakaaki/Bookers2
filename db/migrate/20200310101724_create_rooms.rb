class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user1_id
      t.integer :user2_id

      t.timestamps
    end
  end
end
