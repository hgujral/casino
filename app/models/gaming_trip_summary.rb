class GamingTripSummary < ActiveRecord::Base
  
    belongs_to :patron
    has_many :game_trips

end
