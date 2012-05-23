namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Patron].each(&:delete_all)
    
    Patron.populate 100 do |person|
      person.card_number = 300000..500000
      person.first_name = Faker::Name.first_name
      person.last_name = Faker::Name.last_name
      person.dob = 65.years.ago..21.years.ago
      person.city    = Faker::Address.city
      person.state   = Faker::Address.us_state_abbr
      person.phone   = Faker::PhoneNumber.phone_number
      person.agent_id = [12345, 23456, 34567]
    end
  end
end

