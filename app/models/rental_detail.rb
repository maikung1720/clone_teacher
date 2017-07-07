class RentalDetail < ActiveRecord::Base
    belongs_to :labware
    belongs_to :rental
    
end
