class Patron < ActiveRecord::Base
  
  has_many :remarks
  has_many :game_trip_summary
  
end
