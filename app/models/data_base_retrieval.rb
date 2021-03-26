class DataBaseRetrieval
    def initialize(origin, destination, plan)
        @origin = rectify_area_code origin
        @destination = rectify_area_code destination
        @plan = plan
    end

    def rectify_area_code(code)
        if code.length == 1
            rectified_code = "00"+ code
        elsif code.length == 2
            rectified_code = "0"+ code
        elsif code.length == 3
            rectified_code = code
        end
    end

    def search_plan
        phone_plan = PhonePlan.find_by(name: @plan)
    end

    def search_fare
        origin_destination_fare = OriginDestinationFare.find_by(origin: @origin, destination: @destination)
    end

    def to_s
        "Fare: #{search_fare.fare}, Destination: #{@destination}, Plan: #{self.search_plan}"
    end
end