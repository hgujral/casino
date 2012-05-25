namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Patron].each(&:delete_all)
    
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
    end
  end
end

