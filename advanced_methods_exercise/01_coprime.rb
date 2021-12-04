def repeat(str)
    new = str.split(" ")
    new.each do |word|
        return false if new.count(word) > 1
    end
    return "no repetitions"
end
    
str = "bajek o mnie już starczy co jeśli wszystko widzisz czy na tarczy wiesz ze dobry początek i fragment zgarnę to moje ja , w lustrze jak dzień nigdy silna znów tu stoję nic nie zmienia myślisz że znasz, koniec nawet gdy wilczy bilet czuję tonę musze cię słuchać nie, czytam sobie ogarniam tyle ostatnia scen pewny krok poprawiam koronę przecież, rośne siłę rzucasz mi słaby tekst skreślasz z mapy sprawdzasz się mam jakiś stan nowych dram tak mało wiesz, tak, sezon bez braw tylko złudzenie ty zabrać chcesz role tym filmie od lat wiem wojen wywarzę te drzwi impetem słów zero zwiewnie"
    
puts repeat(str)