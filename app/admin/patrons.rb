ActiveAdmin.register Patron do
  
  index do
    column "Card Number"  do |patron|
      link_to patron.card_number, admin_patron_path(patron)
    end
    column :first_name
    column :last_name
    column :dob
    column :home_city
    column :home_state
    column :home_phone
  end
  
  show do
    panel "Patron" do
      attributes_table_for patron, :first_name, :last_name, :dob
    end
    panel "Remarks" do
      table_for(patron.remarks.order("expired_at desc")) do |t|
        t.column("Description") {|remark| remark.description }
        t.column("Expires")   {|remark| remark.expired_at.strftime("%m-%d-%Y") }
        t.column("Agent ID")   {|remark| remark.agent_id }
        t.column("Visible To")   {|remark| remark.visible_to }
      end
    end
    panel "Gaming Trip Summary" do
      table_for(patron.gaming_trip_summary.order("played_at desc")) do |t|
        t.column("Played") {|trip_summary| link_to trip_summary.played_at.strftime("%m-%d-%Y"), admin_gaming_trip_summary_path(trip_summary) }
        t.column("Avergae Bet")   {|trip_summary| trip_summary.average_bet }
        t.column("Percent Table")   {|trip_summary| trip_summary.percent_table }
        t.column("Percent Slot")   {|trip_summary| trip_summary.percent_slot }
        t.column("Total Points")   {|trip_summary| trip_summary.total_points }
        t.column("Total NG Comps")   {|trip_summary| trip_summary.total_ng_comp }
        t.column("ADT")   {|trip_summary| trip_summary.adt }
        t.column("ADL")   {|trip_summary| trip_summary.adl }
        t.column("Days W/o Play")   {|trip_summary| trip_summary.days_without_play }
        t.column("W/L after tax")   {|trip_summary| trip_summary.wl_after_tax }
        t.column("Buy In")   {|trip_summary| trip_summary.buy_in }
        t.column("Coin In")   {|trip_summary| trip_summary.coin_in }
      end
    end
    panel "Table Trip Summary" do
      table_for(patron.table_trip_summary.order("start_at desc")) do |t|
        t.column("Start Date") {|trip_summary| link_to trip_summary.start_at.strftime("%m-%d-%Y"), admin_table_trip_summary_path(trip_summary) }
        t.column("End Date") {|trip_summary| trip_summary.end_at.strftime("%m-%d-%Y") }
        t.column("Duration")   {|trip_summary| trip_summary.duration }
        t.column("Average Bet")   {|trip_summary| trip_summary.average_bet }
        t.column("Buy In Cash")   {|trip_summary| trip_summary.buy_in_cash }
        t.column("Buy In Check")   {|trip_summary| trip_summary.buy_in_check }
        t.column("Buy In Chip")   {|trip_summary| trip_summary.buy_in_chip }
        t.column("Total Buy In")   {|trip_summary| trip_summary.total_buy_in }
        t.column("Win / Loss")   {|trip_summary| trip_summary.win_loss }
      end
    end
    panel "Slot Trip Summary" do
      table_for(patron.slot_trip_summary.order("start_at desc")) do |t|
        t.column("Start At") {|trip_summary|  link_to trip_summary.start_at.strftime("%m-%d-%Y"), admin_slot_trip_summary_path(trip_summary) }
        t.column("End At") {|trip_summary|  trip_summary.end_at.strftime("%m-%d-%Y") }
        t.column("Duration") {|trip_summary|  trip_summary.duration }
        t.column("Average Bet")   {|trip_summary| trip_summary.average_bet }
        t.column("Coin In")   {|trip_summary| trip_summary.coin_in }
        t.column("Coin Out")   {|trip_summary| trip_summary.coin_out }
        t.column("Jackpot")   {|trip_summary| trip_summary.jackpot }
        t.column("Theo Win/Loss")   {|trip_summary| trip_summary.theo_win_loss }
        t.column("Total Loss")   {|trip_summary| trip_summary.total_loss }
      end
    end
  end

  
end
