require 'date'

module Stringy
    class Date
        def initialize(obj)
            unless obj.is_a?(::Date)
                raise ArgumentError, "A Date must be passed into the initializer, but a #{obj.class} was passed in"
            end
            
            @date = obj
        end

        def time_since
            difference_in_days = (::Date.today - date).to_i
            if difference_in_days == 0
                '0 days'
            elsif difference_in_days == 1
                '1 day'
            elsif difference_in_days < 7
                "#{difference_in_days} days"
            elsif difference_in_days < 14
                '1 week'
            elsif difference_in_days < 28
                weeks = difference_in_days / 7
                "#{weeks} weeks"
            elsif difference_in_days < (::Date.today - (::Date.today << 2))
                '1 month'
            elsif difference_in_days < 365
                months = difference_in_days / (365 / 12)
                "#{months} months"
            elsif difference_in_days < 365 * 2
                '1 year'
            else
                years = difference_in_days / 365
                "#{years} years"
            end
        end

        private

        attr_reader :date
    end
end
