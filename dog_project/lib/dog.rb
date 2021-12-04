class Dog
    
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def bark
        return @bark.upcase if age > 3
        return @bark.downcase if age <= 3
    end

    def favorite_foods
        return @favorite_foods
    end

    def age=(n)
        @age = n
    end
    
    def favorite_food?(food)
        if @favorite_foods.include?(food.downcase.capitalize)
            return true
        else 
            return false
        end
    end

end
