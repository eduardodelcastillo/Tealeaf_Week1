#Blackjack using method from lessons
# 20131108

def calculate_total(cards)
# [['Diamond', '3'], ['Heart', 'Jack'], ...]
  total = 0
  cards.each { |x| 
    case x[1]
      when 'Jack'
        total += 10
      when 'Queen'
        total += 10
      when 'King'
        total += 10
      when 'Ace'
        if total < 11
          total += 11
        else
          total += 1
        end
      else
        total += x[1].to_i
      end
  }
  total
end

suits = %w(Diamond Heart Club Spade)
cards = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

deck = suits.product(cards)

puts 'Welcome to Blackjack!'

# Dealing the cards 
deck.shuffle!
playercards = []
dealercards = []
playercards << deck.pop
dealercards << deck.pop
playercards << deck.pop

#Calculate total
player_total = 0
dealer_total = 0
player_total = calculate_total(playercards)

puts "Dealer has #{dealercards[0]}"
puts "You have #{playercards[0]} and #{playercards[1]} for a total of #{player_total}."

#Case for blackjack
if player_total == 21
  puts 'You hit blackjack!'
  # Check if dealer also has blackjack
  dealercards << deck.pop
  dealer_total = calculate_total(dealercards)
  puts "Dealer has #{dealercards[0]} and #{dealercards[1]} for a total #{dealer_total}."
  if dealer_total == 21
    puts 'Dealer has blackjack! It\'s a draw!'
  else
    puts 'Congratulations! You win!'
  end
  exit
end

#All other cases
while player_total < 21
  puts 'Do you want to 1 Hit or 2 Stay?'
  hit_or_stay = gets.chomp
  if hit_or_stay == '1'
    newcard = deck.pop
    puts "Dealing new card for player: #{newcard}"
    playercards << newcard
    puts "You have #{playercards}"
    player_total = calculate_total(playercards)
    puts "Total #{player_total}"
    if player_total > 21
      puts 'Sorry, you busted! You lost.'
      exit
    end
  elsif hit_or_stay == '2'
    puts 'You chose to stay.'
    break
  else
    puts 'Invalid choice. Please press 1 for Hit or 2 for Stay.'
  end
end

# Dealer's turn
dealercards << deck.pop
puts "Dealer has #{dealercards[0]} and #{dealercards[1]}"
dealer_total = calculate_total(dealercards)
puts "Total #{dealer_total}"

# Case for dealer's blackjack
if dealer_total == 21 && player_total != 21
  puts 'Dealer has blackjack! Sorry, you lost.'
  exit
end

# All other cases
while dealer_total < 17
  newcard = deck.pop
  puts "Dealing new card for dealer: #{newcard}"
  dealercards << newcard
  puts "Dealer has #{dealercards}"
  dealer_total = calculate_total(dealercards)
  puts "Total #{dealer_total}"
end

# Comparing total to determine winner
if dealer_total > 21
  puts 'Dealer busted. Congratulations! You win!'
elsif dealer_total == player_total
  puts 'It\'s a draw!'
elsif dealer_total < player_total
  puts 'Congratulations! You win!'
else
  puts 'Sorry, dealer wins!'
end  

