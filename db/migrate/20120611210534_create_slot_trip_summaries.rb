class CreateSlotTripSummaries < ActiveRecord::Migration
  def change
    create_table :slot_trip_summaries do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :duration
      t.integer :average_bet
      t.integer :coin_in
      t.integer :coin_out
      t.integer :jackpot
      t.integer :theo_win_loss
      t.integer :total_loss
      t.string :credit_action
      t.integer :patron_id
      
      t.timestamps
    end
  end
end
