class CreateTableTrips < ActiveRecord::Migration
  def change
    create_table :table_trips do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :average_bet
      t.integer :total_buy_in
      t.integer :buy_in_cash
      t.integer :buy_in_check
      t.integer :buy_in_chip
      t.integer :win_loss
      t.string :credit_action
      t.integer :table_trip_summary_id

      t.timestamps
    end
  end
end
