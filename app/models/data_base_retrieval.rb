class DataBaseRetrieval
    def rectify_area_code(code)
        if code.length == 1
            rectified_code = "00"+ code
        elsif code.length == 2
            rectified_code = "0"+ code
        elsif code.length == 3
            rectified_code = code
        end
    end

    def search_plan(plan)
        phone_plan = PhonePlan.find_by(name: plan)
    end

    def search_fare(origin, destination)
        origin_destination_fare = OriginDestinationFare.find_by(origin: rectify_area_code(origin), destination: rectify_area_code(destination))
    end
end