def reverser(str, &block)
    block.call(str.reverse)
end

def word_changer(sent, &block)
    sent = sent.split(" ")
    new = []
    sent.each do |word|
        new << block.call(word)
    end
    new.join(" ")
end

def greater_proc_value(n, prc, prc2)
    return prc.call(n) if prc.call(n) > prc2.call(n)
    return prc2.call(n) if prc.call(n) < prc2.call(n)
end

def and_selector(arr, prc, prc2)
    new = []
    arr.each {|el| new << el if prc.call(el) && prc2.call(el)}
    new
end

def alternating_mapper(arr, prc, prc2)
    new = []
    arr.each_with_index do |el, i|
        new << prc.call(el) if i.even?
        new << prc2.call(el) if !i.even?
    end
    new
end