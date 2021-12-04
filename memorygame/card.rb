class Card
    attr_accessor :side
    attr_reader :symbol
    def initialize(symbol)
        @symbol = symbol
        @side = false
    end
    

    
    def hide
        @side = false
    end

    def reveal
        @side = true
    end

end