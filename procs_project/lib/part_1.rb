def my_map(arr,&block)
    new = []
    arr.each {|el| new << block.call(el)}
    new
end

def my_select(arr,&block)
    new = []
    arr.each {|el| new << el if block.call(el)}
    new
end

def my_count(arr,&block)
    new = 0
    arr.each {|el| new += 1 if block.call(el)}
    new
end

def my_any?(arr,&block)
    new = 0
    arr.each {|el| new += 1 if block.call(el)}
    return true if new>0
    return false if new = 0 
end

def my_all?(arr,&block)
    new = 0
    arr.each {|el| new += 1 if block.call(el)}
    return true if new == arr.length
    return false if new < arr.length
end

def my_none?(arr,&block)
    new = 0
    arr.each {|el| new += 1 if block.call(el)}
    return true if new == 0
    return false if new > 0 
end