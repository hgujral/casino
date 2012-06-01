ActiveAdmin.register GamingTripSummary do
  menu false
  
  show do
    panel "Gaming Trip Summary" do
      attributes_table_for gaming_trip_summary, :played_at, :average_bet
    end
    panel "Gaming Trip" do
      table_for(gaming_trip_summary.gaming_trips.order("played_at")) do |t|
        t.column("Played") {|trip_summary|  trip_summary.played_at.strftime("%m-%d-%Y") }
        t.column("Avergae Bet")   {|trip_summary| trip_summary.average_bet }
        t.column("Percent Table")   {|trip_summary| trip_summary.percent_table }
        t.column("Percent Slot")   {|trip_summary| trip_summary.percent_slot }
        t.column("Total Points")   {|trip_summary| trip_summary.total_points }
        t.column("Total NG Comps")   {|trip_summary| trip_summary.total_ng_comp }
        t.column("ADT")   {|trip_summary| trip_summary.adt }
        t.column("ADL")   {|trip_summary| trip_summary.adl }
        t.column("W/L after tax")   {|trip_summary| trip_summary.wl_after_tax }
        t.column("Buy In")   {|trip_summary| trip_summary.buy_in }
        t.column("Coin In")   {|trip_summary| trip_summary.coin_in }
      end
    end
  end
  
end
