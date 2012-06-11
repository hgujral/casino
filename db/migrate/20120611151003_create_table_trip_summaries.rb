class CreateTableTripSummaries < ActiveRecord::Migration
  def change
    create_table :table_trip_summaries do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :duration
      t.integer :average_bet
      t.integer :total_buy_in
      t.integer :buy_in_cash
      t.integer :buy_in_check
      t.integer :buy_in_chip
      t.integer :win_loss
      t.string :credit_action
      t.integer :patron_id

      t.timestamps
    end
  end
end
