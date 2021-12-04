def sentence_swap(sent,hash)
    arr = sent.split(" ")
    arr.each_with_index do |word,i|
        arr[i] = hash[word] if hash.include?(word)
    end
    arr.join(" ")   
end

p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'