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
      attributes_table_for patron, :card_number, :first_name, :last_name, :dob
    end
    panel "Remarks" do
      table_for(patron.remarks.order("expired_at desc")) do |t|
        t.column("Description") {|remark| remark.description }
        t.column("Expires")   {|remark| remark.expired_at.strftime("%m-%d-%Y") }
        t.column("Entered Date")   {|remark| remark.created_at.strftime("%m-%d-%Y") }
        t.column("Entered By Code")   {|remark| remark.entered_by_code }
        t.column("Entered By Name")   {|remark| remark.entered_by_name }
        t.column("Visible To")   {|remark| remark.visible_to }
      end
    end
    panel "Gaming Visit" do
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
    panel "Table Visit" do
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
    panel "Slot Visit" do
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
    panel "Event Registrations" do
      table_for(patron.event_registrations.order("start_date desc")) do |t|
        t.column("Name")   {|event_registration| link_to event_registration.event_name, admin_event_registration_path(event_registration) }
        t.column("Type")   {|event_registration| event_registration.event_type }
        t.column("Start Date") {|event_registration|  event_registration.start_date.strftime("%m-%d-%Y") }
        t.column("End Date") {|event_registration|  event_registration.end_date.strftime("%m-%d-%Y") }
        t.column("Tickets Booked") {|event_registration|  event_registration.tickets_booked }
        t.column("Tickets Available")   {|event_registration| event_registration.tickets_available }
      end
    end
    panel "Non Gaming Comps" do
      table_for(patron.non_gaming_comps.order("reservation_at desc")) do |t|
        t.column("Reservation At")   {|non_gaming_comp| link_to non_gaming_comp.reservation_at, admin_non_gaming_comp_path(non_gaming_comp) }
        t.column("Revenue Center")   {|non_gaming_comp| non_gaming_comp.revenue_center }
        t.column("Status")   {|non_gaming_comp| non_gaming_comp.status }
      end
    end
    panel "Point Balance" do
      attributes_table_for patron, :pre_auth_comp_cash, :available_comp_cash
    end
    panel "Point Balances" do
      table_for(patron.point_balances.order("balance_at desc")) do |t|
        t.column("Balance At")   {|point_balance| link_to point_balance.balance_at, admin_point_balance_path(point_balance) }
        t.column("Revenue Center")   {|point_balance| point_balance.revenue_center }
        t.column("Description")   {|point_balance| point_balance.description }
      end
    end
    panel "Tier Levels" do
      table_for(patron.tier_levels.order("start_on desc")) do |t|
        t.column("Start On")   {|tier_level| link_to tier_level.start_on, admin_tier_level_path(tier_level) }
        t.column("End On")   {|tier_level| tier_level.end_on }
        t.column("Tier Level Name")   {|tier_level| tier_level.name }
        t.column("Current Tier Balance")   {|tier_level| tier_level.current_tier_balance }
      end
    end
  end

  
end
