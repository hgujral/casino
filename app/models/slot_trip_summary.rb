class SlotTripSummary < ActiveRecord::Base
    belongs_to :patron
    has_many :slot_trips  
end
