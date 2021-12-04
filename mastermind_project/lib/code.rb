class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.each do |key|
      return false if !POSSIBLE_PEGS.include?(key.upcase)
    end
    return true
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map {|char| char.upcase}
    else raise ExceptionError
    end
  end

  def self.random(num)
    random_pegs = []
    num.times {random_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(random_pegs)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end
  
  def [](index)
    return @pegs[index]
  end

  def length
    return @pegs.length
  end

  def num_exact_matches(code)
    counter = 0
    self.pegs.each.with_index do |peg,i|
      if code.pegs.include?(peg) && code.pegs[i] == peg
        counter += 1
      end
    end
    return counter
  end

  def num_near_matches(code)
    arr = Array.new(code.pegs)
    arr2 = Array.new(self.pegs)
    counter = 0
    self.pegs.each.with_index do |peg,i|
      if arr.include?(peg) && arr[i] == peg
        arr[i] = nil
        arr2[i] = "x"
      end
    end
    
    arr2.each.with_index do |peg,i|
      if arr.include?(peg) && arr[i] != peg
        arr[arr.index(peg)] = nil
        counter += 1
      end
    end
    return counter
  end

  def ==(code)
    self.pegs == code.pegs
  end
end
