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
  end

  
end
