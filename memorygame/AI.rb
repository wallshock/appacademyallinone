class AI
    attr_reader :size
    attr_accessor :picks, :memory, :used, :prevpick
    def initialize(size=[6].sample)
        @size = size
        @used = []
        @memory = Hash.new(0)
        @picks = nil
        @prevpick = nil
    end

    def getguess
        if @memory.none? {|k,v| @memory.values.count(v) == 2}
            guess = self.random
            @used << guess
            @prevpick = guess
            return guess
        end
            
            if @picks == nil
                @picks = @memory.select {|k,v| @memory.values.count(v) == 2}
            end
        if @picks.keys[0] != @prevpick
            @prevpick = @picks.keys[0]
            return @picks.keys[0]
        end
        return @picks.keys[-1]
        
    end

    def clearpicks
        @picks = nil
    end

    def clearmemory(symbol)
        @memory.reject! {|k,v| v==symbol}
    end

    def random
        guess = [(1..@size).to_a.sample, (1..@size).to_a.sample].map(&:to_i)
        while @used.include?(guess)
            guess = [(1..@size).to_a.sample, (1..@size).to_a.sample].map(&:to_i)
        end
        guess
    end

    def getsize
        @size
    end

    def receive_card(guess,symbol)
        @memory[guess] = symbol
    end
end