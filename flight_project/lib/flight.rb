require 'passenger.rb'

class Flight
    attr_reader :passengers
    def initialize(str,n)
        @flight_number = str
        @capacity = n
        @passengers = []
    end

    def full?
        return true if @passengers.count == @capacity
        return false
    end

    def board_passenger(passenger)
        if !self.full?
            if passenger.has_flight?(@flight_number)
                @passengers << passenger
            end
        end
    end

    def list_passengers
        arr = []
        @passengers.each do |pass|
            arr << pass.name
        end
        arr
    end
    
    def [](i)
        return @passengers[i]
    end
    
    def <<(passenger)
        board_passenger(passenger)
    end
end