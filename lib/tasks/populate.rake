namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Patron, Remark, GamingTripSummary, GamingTrip, TableTripSummary, TableTrip, SlotTripSummary, SlotTrip].each(&:delete_all)
    
    Patron.populate 5 do |person|
      person.card_number = 300000..500000
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
      Remark.populate 2..10 do |remark|
        remark.patron_id = person.id
        remark.description = Faker::Lorem.sentence
        remark.expired_at = 2.months.from_now..4.months.from_now
        remark.agent_id = [12345, 23456, 34567]
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
      EventRegistration.populate 5..10 do |event_registration|
      end
    end
  end
end

