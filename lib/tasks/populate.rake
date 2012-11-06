namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Room, Patron, Remark, GamingTripSummary, GamingTrip, TableTripSummary, TableTrip, SlotTripSummary, SlotTrip, EventRegistration, NonGamingComp, PointBalance].each(&:delete_all)
    
    
    [
      ['DL - Floors 11 - 23', 'A2 - 2 Queen, Non-Smoking', [1100, 1101, 1102]],
      ['DL - Floors 11 - 23', 'CK - Cove, Smoking', [1200, 1201, 1202]],
      ['DL - Floors 11 - 23', 'C1 - Cove, Non-Smoking', [1300, 1301, 1302]],
      ['DL - Floors 11 - 23', 'SK - Sky, Smoking', [1400, 1401, 1402]],
      ['DL - Floors 11 - 23', 'S1 - Sky, Non-Smoking', [1500, 1501, 1502]],
      ['LX - Floors 24 - 36', 'AK - 1 King, Smoking', [2400, 2401, 2402]],
      ['LX - Floors 24 - 36', 'AQ - 2 Queen, Smoking', [2500, 2501, 2502]],
      ['LX - Floors 24 - 36', 'A2 - 2 Queen, Non-Smoking', [2600, 2601, 2602]],
      ['LX - Floors 24 - 36', 'RK - Riverview, Smoking', [2700, 2701, 2702]],
      ['LX - Floors 24 - 36', 'R1 - Riverview, Non-Smoking', [2800, 2801, 2802]]
    ].each do |w, t, rooms|
      rooms.each do |n|
        Room.create! :wing_type => w, 
          :room_type => t, 
          :room_number => n,
          :occupied => false,
          :inspected => false,
          :depart_on =>  Time.now,
          :next_reservation_on => Time.now + (rand * Time.now.to_i)
      end
    end
    
    Patron.populate 4 do |person, index|
      person.card_number = 4851600 if index == 1
      person.card_number = 3557887 if index == 2
      person.card_number = 5452028 if index == 3
      person.card_number = 2403544 if index == 4
      person.first_name = Faker::Name.first_name
      person.last_name = Faker::Name.last_name
      person.email = Faker::Internet.free_email
      person.dob = 65.years.ago..21.years.ago
      person.gender = ['Male', 'Female']
      person.aka = ''
      person.passport_number = 123456789..999999999
      person.ethnicity = ['Asian', 'Hispanic', 'Caucasian', 'African American']
      person.ssn = 150000000..199999999
      person.mail_code = ['Home', 'Business', 'None']
      person.home_phone = Faker::PhoneNumber.phone_number
      person.cell_phone = Faker::PhoneNumber.phone_number
      person.other_phone = Faker::PhoneNumber.phone_number
      person.dl_state = Faker::Address.us_state_abbr
      person.dl_number = 050000000..699999999
      person.dl_expires_at = 2.months.ago..3.years.from_now
      person.home_address = Faker::Address.street_address 
      person.home_city = Faker::Address.city
      person.home_state = Faker::Address.us_state_abbr
      person.home_zip = Faker::Address.zip_code
      person.home_country = 'US'
      person.business_name = Faker::Company.name
      person.business_address = Faker::Address.street_address 
      person.business_city = Faker::Address.city
      person.business_state = Faker::Address.us_state_abbr
      person.business_zip = Faker::Address.zip_code
      person.busines_country = 'US'
      person.tier_level = ['Wolf', 'Sacham', 'Sagamore']
      person.tier_balance = 5000..50000
      person.points_to_next_tier = 500..4000
      person.acsc_code_status = ['Maintenance', 'Development']
      person.adt = 50..5000
      person.representative = Faker::Name.name
      person.point_balance = 5000..50000
      person.agent_id = [12345, 23456, 34567]
      Remark.populate 1..2 do |remark|
        remark.patron_id = person.id
        remark.description = Faker::Lorem.sentence
        remark.expired_at = 2.months.from_now..4.months.from_now
        remark.agent_id = [12345, 23456, 34567]
        remark.entered_at = Time.now
        remark.entered_by_code = [12345, 23456, 34567]
        remark.entered_by_name = Faker::Name.name
        remark.visible_to = ['A', 'AL']
      end
      GamingTripSummary.populate 5..10 do |trip_summary|
        trip_summary.played_at = 11.months.ago..2.months.ago
        trip_summary.average_bet = 100..1000
        trip_summary.percent_table = 1..100
        trip_summary.percent_slot = 100 - trip_summary.percent_table
        trip_summary.total_points = 1000..20000
        trip_summary.total_ng_comp = 1000..2000
        trip_summary.adt = 100..1000
        trip_summary.adl = trip_summary.adt - 20
        trip_summary.days_without_play = 3..10
        trip_summary.wl_after_tax = -500..500
        trip_summary.buy_in = 30..300
        trip_summary.coin_in = 20..200
        trip_summary.credit_action = ''
        trip_summary.patron_id = person.id
        d = trip_summary.played_at
        GamingTrip.populate 2..5 do |trip|
          trip.played_at = d
          d += 1.day
          trip.average_bet = 100..1000
          trip.percent_table = 1..100
          trip.percent_slot = 100 - trip.percent_table
          trip.total_points = 1000..20000
          trip.total_ng_comp = 1000..20000
          trip.adt = 100..1000
          trip.adl = trip.adt - 20
          trip.wl_after_tax = -500..500
          trip.buy_in = 30..300
          trip.coin_in = 20..200
          trip.credit_action = ''
          trip.gaming_trip_summary_id = trip_summary.id
        end
      end
      TableTripSummary.populate 5..10 do |trip_summary|
        trip_summary.start_at = 11.months.ago..2.months.ago
        trip_summary.duration = 2..5
        trip_summary.end_at = trip_summary.start_at + trip_summary.duration.days - 1.day
        trip_summary.average_bet = 100..1000
        trip_summary.buy_in_cash = 30..300
        trip_summary.buy_in_check = 30..300
        trip_summary.buy_in_chip = 30..300
        trip_summary.total_buy_in = trip_summary.buy_in_cash + trip_summary.buy_in_check + trip_summary.buy_in_chip        
        trip_summary.win_loss = -500..500
        trip_summary.credit_action = ''
        trip_summary.patron_id = person.id
        d = trip_summary.start_at
        TableTrip.populate trip_summary.duration do |trip|
          trip.start_at = d
          d += 1.day
          trip.end_at = trip.start_at + 3.hours
          trip.average_bet = 100..1000
          trip.buy_in_cash = 10..100
          trip.buy_in_check = 10..100
          trip.buy_in_chip = 10..100
          trip.total_buy_in = trip.buy_in_cash + trip.buy_in_check + trip.buy_in_chip        
          trip.win_loss = -500..500
          trip.credit_action = ''
          trip.table_trip_summary_id = trip_summary.id
        end
      end
      SlotTripSummary.populate 5..10 do |trip_summary|
        trip_summary.start_at = 11.months.ago..2.months.ago
        trip_summary.duration = 2..5
        trip_summary.end_at = trip_summary.start_at + trip_summary.duration.days - 1.day
        trip_summary.average_bet = 100..1000
        trip_summary.coin_in = 30..300
        trip_summary.coin_out = 30..300
        trip_summary.jackpot = 30000..3000000
        trip_summary.theo_win_loss = -500..500        
        trip_summary.total_loss = -500..500
        trip_summary.credit_action = ''
        trip_summary.patron_id = person.id
        d = trip_summary.start_at
        SlotTrip.populate trip_summary.duration do |trip|
          trip.start_at = d
          d += 1.day
          trip.duration = 2..5
          trip.zone_location = ''
          trip.asset = ''
          trip.average_bet = 100..1000
          trip.coin_in = 30..300
          trip.coin_out = 30..300
          trip.pull_rate = 3..10
          trip.theo_win_loss = -500..500        
          trip.total_loss = 200..500
          trip.credit_action = ''
          trip.slot_trip_summary_id = trip_summary.id
        end
      end
      EventRegistration.populate 1..2 do |event_registration|
        event_registration.event_name = Faker::Lorem.sentence
        event_registration.event_type = ['Concert', 'Golf', 'Game']
        event_registration.start_date = 5.months.ago..3.months.from_now
        event_registration.end_date = event_registration.start_date + 2.days
        event_registration.tickets_booked = 1..4
        event_registration.tickets_available = 50..65
        event_registration.pre_auth = [true, false]
        event_registration.played = [true, false]
        event_registration.status = ['Redeemed', 'Voided', 'Issued']
        event_registration.no_show = [true, false]
        event_registration.patron_id = person.id
      end
      NonGamingComp.populate 3..5 do |non_gaming_comp|
        non_gaming_comp.reservation_at = 5.months.ago..2.months.ago
        non_gaming_comp.revenue_center = Populator.words(1..5).titleize
        non_gaming_comp.status = ['Redeemed', 'Voided', 'Issued']
        non_gaming_comp.amount = 100..500
        non_gaming_comp.comp_number = 21323..32455
        non_gaming_comp.discretionary = [true, false]
        non_gaming_comp.played = [true, false]
        non_gaming_comp.no_of_people = 1..4
        non_gaming_comp.reason = ''
        non_gaming_comp.meal_type = ['Breakfast', 'Lunch', 'Dinner', 'Snack']
        non_gaming_comp.approved_by = Faker::Name.name
        non_gaming_comp.entered_by = Faker::Name.name
        non_gaming_comp.comments = Populator.sentences(2..3)
        non_gaming_comp.patron_id = person.id
      end
      PointBalance.populate 3..5 do |point_balance|
        point_balance.corporate_id = 123232..232343
        point_balance.balance_at = 5.months.ago..2.months.ago
        point_balance.revenue_center = Populator.words(1..5).titleize
        point_balance.description = Populator.words(1..5).titleize
        point_balance.amount = 100..500
        point_balance.balance = 100..500
        point_balance.comp_number = 21323..32455
        point_balance.entered_by = Faker::Name.name
        point_balance.authorized_by = Faker::Name.name
        point_balance.patron_id = person.id
      end
      TierLevel.populate 1..3 do |tier_level|
        tier_level.start_on = 5.years.ago..3.years.ago
        tier_level.end_on = tier_level.start_on + 2.years
        tier_level.name = ['Player', 'Wolf', 'Sagamore']
        tier_level.current_tier_balance = 1200..2000 if tier_level.name == 'Player'
        tier_level.current_tier_balance = 2001..20000 if tier_level.name == 'Wolf'
        tier_level.current_tier_balance = 20001..200000 if tier_level.name == 'Sagamore'
        tier_level.patron_id = person.id
      end
    end
  end
end

