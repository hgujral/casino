class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :wing_type
      t.string :room_type
      t.integer :room_number
      t.boolean :occupied
      t.boolean :inspected
      t.string :connected
      t.datetime :depart_on
      t.datetime :next_reservation_on

      t.timestamps
    end
  end
end
