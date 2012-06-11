class TableTripSummary < ActiveRecord::Base
    belongs_to :patron
    has_many :table_trips  
end
