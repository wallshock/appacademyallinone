def ice_cream_shop(menu, favouriteflavour)
    return false if menu[1..-1] == nil
    return ice_cream_shop(menu[1..-1],favouriteflavour) if menu[0] != favouriteflavour
    return true if menu[0] == favouriteflavour
end



p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false

p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true

p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false

p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true

p ice_cream_shop([], 'honey lavender')  # => returns false