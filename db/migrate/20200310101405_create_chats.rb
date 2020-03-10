class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :user_room_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
