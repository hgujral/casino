ActiveAdmin.register SlotTripSummary do
  menu false
  
  show do
    panel "Slot Trip Summary" do
      attributes_table_for slot_trip_summary, :start_at, :end_at
    end
    panel "Table Trip" do
      table_for(slot_trip_summary.slot_trips.order("start_at")) do |t|
        t.column("Date") {|trip_summary|  trip_summary.start_at.strftime("%m-%d-%Y") }
        t.column("Start At") {|trip_summary|  trip_summary.start_at.strftime("%H:%M:%S") }
        t.column("Duration") {|trip_summary|  trip_summary.duration }
        t.column("Zone/Loc")   {|trip_summary| trip_summary.zone_location }
        t.column("Asset")   {|trip_summary| trip_summary.asset }
        t.column("Average Bet")   {|trip_summary| trip_summary.average_bet }
        t.column("Coin In")   {|trip_summary| trip_summary.coin_in }
        t.column("Coin Out")   {|trip_summary| trip_summary.coin_out }
        t.column("Pulls / Min")   {|trip_summary| trip_summary.pull_rate }
        t.column("Theo Win/Loss")   {|trip_summary| trip_summary.theo_win_loss }
        t.column("Total Loss")   {|trip_summary| trip_summary.total_loss }
      end
    end
  end
end
