# Sorting from Learn to Program by Chris Pine Chapter 10
# 20131110

words = %w(apple zoology berserk catnip daschund elephant aardvark major nuclear island major)

def sorting some_array # This "wraps" recursive_sort.
  recursive_sort some_array, []
end

def recursive_sort unsorted_array, sorted_array
  # Go through each element of the array, compare and find which word should go first
  # according to the dictionary
  # Then move that word into sorted_array
  while unsorted_array.length != 0
    smallest_word = unsorted_array[0] 
    unsorted_array.each { |x| 
      if x < smallest_word
        smallest_word = x
      end
    }
    sorted_array << smallest_word
    unsorted_array.slice!(unsorted_array.index(smallest_word)) # This gets the index of the 
    # smallest_word then the slice! deletes that object at that index - brilliant!
  end
  sorted_array
end

puts 'Using the in-built array method "sort": '
puts words.sort
new_words = []
new_words = sorting(words)
puts 'Using my own sorting method: '
puts new_words




