class OriginDestinationFare < ApplicationRecord
    def fare
        self[:fare]
    end
end
