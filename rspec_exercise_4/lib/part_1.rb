def my_reject(arr, &blk)
    newarr = []
    arr.each do |el|
        newarr << el if !blk[el]
    end
    newarr 
end

def my_one?(arr, &blk)
    counter = 0
    arr.each do |el|
        counter += 1 if blk[el]
    end
    return true if counter == 1
    return false
end

def hash_select(hash, &blk)
    hashnew = Hash.new(0)
    hash.each do |k,v|
        hashnew[k] = v if blk[k,v]
    end
    hashnew
end

def xor_select(array, prc, prc2)
    newarr = []
    array.each do |el|
        newarr << el if (prc.call(el) || prc2.call(el)) && !(prc.call(el) && prc2.call(el))   
    end
    newarr
end

def proc_count(value,arr)
    counter = 0
    arr.each do |prc|
        counter += 1 if prc.call(value)
    end
    return counter
end

