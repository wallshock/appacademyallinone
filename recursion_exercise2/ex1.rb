def range(min, max)
    return [] if max <= min
    range(min, max - 1) << max - 1
end


def exponentation(base,power)
    return 1 if power == 0
    base * exponentation(base,power-1)
end


def exponentation2(base,power)
    return 1 if power == 0
    return base if power == 1
    return exponentation2(base,power/2) * exponentation2(base,power/2) if power.even?
    return base * (exponentation2(base,(power-1)/2) * exponentation2(base,(power-1)/2)) if !power.even?
end

class Array
    def deep_dup
        arr = []
        self.each do |el|
            arr << (el.is_a?(Array) ? el.deep_dup : el)
        end
        arr
    end
end

def fibo(n)
    return [0,1].take(n) if n <= 2
    if n > 2
        nums = fibo(n-1)
        nums << nums[-2] + nums[-1]
    end
    
end

def bsearch(array,target)
    index = array.size / 2
    return nil if array.empty?
    case target <=> array[index]
    when -1
        bsearch(array[0...index],target)
    when 0
        index
    when 1
        subans = bsearch(array[index+1..-1],target)
        subans.nil? ? nil : (index + 1) + subans
    end
end

class Array
    def merge_sort
      return self if count < 2
  
      middle = count / 2
  
      left, right = self.take(middle), self.drop(middle)
      sorted_left, sorted_right = left.merge_sort, right.merge_sort
  
      merge(sorted_left, sorted_right)
    end
  
    def merge(left, right)
        merged = []
        until left.empty? || right.empty?
            case left[0] <=> right[0]
            when 1
                merged << right.shift
            when 0
                merged << left.shift
            when -1
                merged << left.shift
            end
        end
        merged + left + right
    end
end

def subsets(arr)
    return [[]] if arr.empty?
    subs = subsets(arr.take(arr.count - 1))
    subs.concat(subs.map { |sub| sub + [arr.last] })
end

def permutations(arr)
    return [arr] if arr.length == 1
    perms = permutations(arr[1..-1])
    char = arr[0]
    result = []
    perms.each do |perm|
        (0..perm.length).each do |i|
          result << perm[0...i] + [char] + perm[i..-1]
        end
      end
    result
end

def make_change(target, coins)
    return [] if target == 0
    best_change = nil
    coins.each do |coin|
        if coin<=target
            rest_of_change = make_change(target-coin,coins)
            change = [coin] + rest_of_change
        end
        if best_change.nil?
            best_change = change
        elsif change.size < best_change.size
            best_change = change
        end
    end
    best_change
end
