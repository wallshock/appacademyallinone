class Human
    attr_accessor :size
    attr_reader :memory
    def initialize
        @size = nil
        @memory = Hash.new(0)
    end

    def getguess
        guess = gets.chomp.split(" ").map(&:to_i)
    end
    
    def memoryclear
        #8))
    end
    def clearpicks
        #esss
    end

    def clearmemory(symbol)
        @memory.reject! {|k,v| v==symbol}
    end
    
    def getsize
        @size = gets.chomp.to_i
    end

    def receive_card(pos,symbol)
        #eeesss
    end
end