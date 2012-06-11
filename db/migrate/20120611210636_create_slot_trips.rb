class CreateSlotTrips < ActiveRecord::Migration
  def change
    create_table :slot_trips do |t|
      t.datetime :start_at
      t.integer :duration
      t.string :zone_location
      t.string :asset
      t.integer :average_bet
      t.integer :coin_in
      t.integer :coin_out
      t.integer :pull_rate
      t.integer :theo_win_loss
      t.integer :total_loss
      t.string :credit_action
      t.integer :slot_trip_summary_id
      
      t.timestamps
    end
  end
end
