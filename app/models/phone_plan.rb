class PhonePlan < ApplicationRecord
    def free_time
        self[:free_time]
    end
end
