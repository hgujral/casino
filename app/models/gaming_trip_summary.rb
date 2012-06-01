class GamingTripSummary < ActiveRecord::Base
  
    belongs_to :patron
    has_many :gaming_trips

end
