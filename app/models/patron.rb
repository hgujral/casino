class Patron < ActiveRecord::Base
  
  has_many :remarks
  has_many :gaming_trip_summary
  
end
