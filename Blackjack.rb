# Blackjack Game
# 20131107

# Storage of cards
card_deck = [
  'Ace Spade', '2 Spade', '3 Spade', '4 Spade', '5 Spade', '6 Spade', '7 Spade', 
  '8 Spade','9 Spade', '10 Spade', 'Jack Spade', 'Queen Spade', 'King Spade',
  'Ace Club', '2 Club', '3 Club', '4 Club', '5 Club', '6 Club', '7 Club', 
  '8 Club', '9 Club', '10 Club', 'Jack Club', 'Queen Club', 'King Club',
  'Ace Heart', '2 Heart', '3 Heart', '4 Heart', '5 Heart', '6 Heart', '7 Heart', 
  '8 Heart', '9 Heart', '10 Heart', 'Jack Heart', 'Queen Heart', 'King Heart',
  'Ace Diamond', '2 Diamond', '3 Diamond', '4 Diamond', '5 Diamond', '6 Diamond', '7 Diamond',
  '8 Diamond', '9 Diamond', '10 Diamond', 'Jack Diamond', 'Queen Diamond', 'King Diamond'
]

def deal_cards(deck)
  deck.shuffle!
  card = deck.pop
end

def card_value(card)
  face = card[0,1].downcase  #gets the first character of a string
  case face
  when 'j'
    card = 10
  when 'q'
    card = 10
  when 'k'
    card = 10
  when 'a'
    card = 11
  else
    card = card.to_i
  end
end

#Ask name
puts 'Welcome to Blackjack! What is your name?'
name = gets.chomp
puts name + ', good luck!'
#Deal cards for the player and dealer
p_card = [] #array for player's cards
d_card = [] # dealer's cards
i = 0 #counter for player
j = 0 #counter for dealer
p_card[i] = deal_cards(card_deck)
d_card[j] = deal_cards(card_deck)
i += 1
j += 1
#2nd card:
p_card[i] = deal_cards(card_deck)
d_card[j] = deal_cards(card_deck)
i += 1
j += 1

puts name + ', your cards are: ' + p_card[0] + ' and ' + p_card[1]
puts 'The dealer\'s open card is: ' + d_card[0]

#Evaluate initial deal
p_hand = card_value(p_card[0]) + card_value(p_card[1])
d_hand = card_value(d_card[0]) + card_value(d_card[1])
if p_hand == 21
  puts 'Blackjack!'
  puts 'Now checking to see dealer\'s other card...'
  puts d_card[1]
  if d_hand == 21
    puts 'Dealer also has blackjack. It\'s a draw!'
  else
    puts 'Congratulations! You win!'
  end
else
  puts 'You got: ' + p_hand.to_s
  while p_hand <= 21
    puts 'Do you want to 1 Hit or 2 Stay?'
    p_choice = gets.chomp.to_i
    if p_choice == 1
      p_card[i] = deal_cards(card_deck)
      puts 'Your next card is: ' + p_card[i]
      # Check for value of Ace
      if p_card[i][0,1] == 'A' && p_hand >= 11
        p_hand = p_hand - 10
      end
      p_hand = p_hand + card_value(p_card[i])
      i += 1
      puts 'You got: ' + p_hand.to_s
      if p_hand > 21
        puts name + ', you busted! Sorry you lost!'
      end
    elsif p_choice == 2
      #Dealer's turn
      puts 'Now checking to see dealer\'s other card...'
      puts d_card[1]
      while d_hand < 17
        d_card[j] = deal_cards(card_deck)
        # Check for value of Ace
        if d_card[j][0,1] == 'A' && d_hand >= 11
          d_hand = d_hand - 10
        end
        d_hand = d_hand + card_value(d_card[j])
        puts 'Dealer\'s next card is ' + d_card[j] + '. Total: ' + d_hand.to_s
        j += 1
      end
      puts 'Dealer\'s total is: ' + d_hand.to_s
      if p_hand > d_hand 
        puts 'Congratulations ' + name +'! You win!'
      elsif d_hand > 21
        puts 'Dealer busted. Congratulations ' + name + '! You win!'
      elsif p_hand == d_hand
        puts 'It\'s a draw!'
      else
        puts 'Sorry ' + name + '. Dealer wins!'
      end
      break
    else
      puts 'Your choice is invalid. Please press 1 to Hit or 2 to Stay.'
    end
  end
end

  
