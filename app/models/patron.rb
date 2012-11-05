class Patron < ActiveRecord::Base
  
  has_many :remarks
  has_many :gaming_trip_summary
  has_many :table_trip_summary
  has_many :slot_trip_summary
  has_many :event_registrations
  has_many :non_gaming_comps
  
end
