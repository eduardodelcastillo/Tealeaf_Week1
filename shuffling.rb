# Shuffle from Learn to Program by Chris Pine Chapter 10
# 20131112

words = %w(apple zoology berserk catnip daschund elephant aardvark major nuclear island major)

def shuffling some_array # This "wraps" recursive_sort.
  recursive_shuffle some_array, []
end

def recursive_shuffle unshuffled_array, shuffled_array
  # Generate a random number up to the length of the array, then use that as the index
  # to move that particular obj in the array to the new array
  transfer_word = '' 
  while unshuffled_array.length != 0
    # Set index in array to transfer to new array by random number
    random_number = Random.new
    random_number = random_number.rand(unshuffled_array.length)
    transfer_word = unshuffled_array[random_number]
    shuffled_array << transfer_word
    unshuffled_array.slice!(unshuffled_array.index(transfer_word)) # This gets the index of the 
    # transfer_word then the slice! deletes that object at that index - brilliant!
  end
  shuffled_array
end

puts 'Using the in-built array method "shuffle": '
puts words.shuffle
new_words = []
new_words = shuffling(words)
puts 'Using my own shuffling method: '
puts new_words


