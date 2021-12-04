require 'prime'
sum = 0
(0..2000000).each do |num|
    sum += num if num.prime?
end

p sum