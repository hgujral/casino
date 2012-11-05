class AddIndexesToAllTables < ActiveRecord::Migration
  def change
    add_index :remarks, :patron_id
    add_index :gaming_trip_summaries, :patron_id
    add_index :gaming_trips, :gaming_trip_summary_id
    add_index :table_trip_summaries, :patron_id
    add_index :table_trips, :table_trip_summary_id
    add_index :slot_trip_summaries, :patron_id
    add_index :slot_trips, :slot_trip_summary_id
    add_index :event_registrations, :patron_id
    add_index :non_gaming_comps, :patron_id
  end
end
