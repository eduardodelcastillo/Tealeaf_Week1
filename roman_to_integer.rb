# Roman to Integer
# Chapter 12.6 Learn to Program by Chris Pine
# This converts roman numerals to its decimal equivalent
# 20131117

puts 'Please input a Roman numeral and it will be converted to its decimal form: '
input = gets.chomp.upcase

def roman_to_integer roman
  # Gets the string eg MCMXCIX -- need to get 1999
  # Go through each digit, convert as normal but if the digit after is bigger 
  # than the current digit - it means it's a subtraction
  counter = 0
  number = 0

  while counter < roman.length
    case roman[counter]
    when 'M'
      number = number + 1000
    when 'D'
      number = number + 500
    when 'C'
      number = number + 100
    when 'X'
      number = number + 10
    when 'V'
      number = number + 5
    when 'I'
      number = number + 1
    else
      puts "Error. That is not a valid roman number."
      exit
    end

    # Test for precedence ie XC or CM or IV
    if roman[counter] == 'C' && roman[counter + 1] == 'M'
      number =  number - 200 # double the deduction as it was added previously
    elsif roman[counter] == 'X' && roman[counter + 1] == 'C'
      number = number - 20
    elsif roman[counter] == 'I' && roman[counter + 1] == 'V'
      number = number - 2
    elsif roman[counter] == 'I' && roman[counter + 1] == 'X'
      number = number - 2
    end
        
    counter = counter + 1
  end
  number
end

puts roman_to_integer(input)