class CreateGamingTrips < ActiveRecord::Migration
  def change
    create_table :gaming_trips do |t|
      t.datetime :played_at
      t.integer :average_bet
      t.decimal :percent_table
      t.decimal :percent_slot
      t.integer :total_points
      t.integer :total_ng_comp
      t.integer :adt
      t.integer :adl
      t.decimal :wl_after_tax
      t.decimal :buy_in
      t.integer :coin_in
      t.integer :credit_action
      t.integer :gaming_trip_summary_id

      t.timestamps
    end
  end
end
