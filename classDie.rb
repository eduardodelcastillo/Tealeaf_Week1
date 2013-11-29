# Classes - creating classes with its own method and instance variables
# from Learn to Program by Chris Pine Chapter 13.3
# 20131119

class Die
  
  def initialize
    roll
  end

  def roll
    @number_showing = 1 + rand(6)
  end

  def showing
    @number_showing
  end

  def cheat
    puts 'What number would you like the die to roll?'
    @number_showing = gets.chomp.to_i
    if @number_showing > 6
      puts 'Error: a die can only roll up to 6'
    end
  end

end

puts Die.new.showing
die1 = Die.new
puts die1.showing
puts die1.roll
puts die1.cheat