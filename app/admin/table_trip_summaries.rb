ActiveAdmin.register TableTripSummary do
  menu false
  
  show do
    panel "Table Trip Summary" do
      attributes_table_for table_trip_summary, :start_at, :end_at
    end
    panel "Table Trip" do
      table_for(table_trip_summary.table_trips.order("start_at")) do |t|
        t.column("Date") {|trip_summary|  trip_summary.start_at.strftime("%m-%d-%Y") }
        t.column("Start At") {|trip_summary|  trip_summary.start_at.strftime("%H:%M:%S") }
        t.column("End At") {|trip_summary|  trip_summary.end_at.strftime("%H:%M:%S") }
        t.column("Average Bet")   {|trip_summary| trip_summary.average_bet }
        t.column("Buy In Cash")   {|trip_summary| trip_summary.buy_in_cash }
        t.column("Buy In Check")   {|trip_summary| trip_summary.buy_in_check }
        t.column("Buy In Chip")   {|trip_summary| trip_summary.buy_in_chip }
        t.column("Total Buy In")   {|trip_summary| trip_summary.total_buy_in }
        t.column("Win / Loss")   {|trip_summary| trip_summary.win_loss }
      end
    end
  end
end
