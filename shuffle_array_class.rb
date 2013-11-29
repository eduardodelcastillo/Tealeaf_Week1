# Shuffle extended to Array Class
# from Learn to Program by Chris Pine Chapter 13.1
# 20131119

words = %w(apple zoology berserk catnip daschund elephant aardvark major nuclear island major)

class Array
  def shuffling
    arr = self
    shuffled_array = []
    # Generate a random number up to the length of the array, then use that as the index
    # to move that particular obj in the array to the new array
    transfer_word = '' 
    while arr.length != 0
      # Set index in array to transfer to new array by random number
      random_number = Random.new
      random_number = random_number.rand(arr.length)
      transfer_word = arr[random_number]
      shuffled_array << transfer_word
      arr.slice!(arr.index(transfer_word)) # This gets the index of the 
      # transfer_word then the slice! deletes that object at that index - brilliant!
    end
    shuffled_array
  end
end

puts 'Using the in-built array method "shuffle": '
puts words.shuffle
new_words = []
new_words = words.shuffling
puts 'Using my own shuffling method: '
puts new_words


