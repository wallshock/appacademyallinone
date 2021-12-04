def all_words_capitalized?(arr)
    arr.all?{|word| word[0].upcase == word[0] && word[1..-1].downcase == word[1..-1]}
end

def no_valid_url?(arr)
    arr.none? do |url|
        url.end_with?(".com", ".net", ".io", ".org")
    end
end

def any_passing_students?(arr)
    arr.any? do |hash|
        avg = hash[:grades].sum / hash[:grades].length
        avg >= 75
    end
end