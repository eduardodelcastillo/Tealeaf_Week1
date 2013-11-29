# Class Dragon
# Ch13.5 of Learn to Program by Chris Pine
# 20131119

class Dragon

  def initialize 
    @asleep = false
    @stuff_in_belly = 10 # ie he's full
    @stuff_in_intestine = 0 # ie he doesn't need to go yet.
    puts 'Welcome to Dragon World. So you decided to have a dragon as a pet?'
    puts 'What would you like to name your dragon?'
    @name = gets.chomp
    puts "#{@name} is born."
    command
  end

  def command
    choice = ''
    while choice != 'exit'
      puts 'What do you want to do with George?'
      puts 'Please choose: 1) feed, 2) walk, 3) toss, 4) put to bed, 5) rock'
      choice = gets.chomp.to_i
      case choice
      when 1
        feed
      when 2
        walk
      when 3
        toss
      when 4
        put_to_bed
      when 5
        rock
      else
        puts 'Error: that choice is invalid. Please enter 1, 2, 3, 4 or 5.'
      end
    end
  end


  def feed
    puts "You feed #{@name}."
    @stuff_in_belly = 10
    passage_of_time
  end

  def walk
    puts "You walk #{@name}."
    @stuff_in_intestine = 0
    passage_of_time
  end

  def put_to_bed
    puts "You put #{@name} to bed."
    @asleep = true
    3.times do 
      if @asleep
        passage_of_time
      end
      if @asleep
        puts "#{@name} snores, filling the room with smoke."
      end
      if @asleep
        @asleep = false
        puts "#{@name} wakes up slowly."
      end
    end
  end

  def toss
    puts "You toss #{@name} up into the air."
    puts 'He giggles, which singes your eyebrows.'
    passage_of_time
  end

  def rock
    puts "You rock #{@name} gently."
    @asleep = true
    puts 'He briefly dozes off...'
    passage_of_time
    if @asleep
      @asleep = false
      puts '...but wakes when you stop.'
    end
  end

  private
  # 'private' means that the methods defined here are methods internal to the object.
  # (You can feed your dragon, but you cannot control when he's hungry.)
  def hungry?
    @stuff_in_belly <=2
  end

  def poopy?
    @stuff_in_intestine >= 8
  end

  def passage_of_time
    if @stuff_in_belly > 0
      # Move from belly to intestine 
      @stuff_in_belly = @stuff_in_belly - 1
      @stuff_in_intestine = @stuff_in_intestine + 1
    else # Dragon is starving!
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts "#{@name} is starving! In desperation, he ate YOU!"
      exit 
    end

    if @stuff_in_intestine >= 10
      @stuff_in_intestine = 0
      puts "Whoops! #{@name} had an accident..."
    end

    if hungry?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts "#{@name}'s stomach grumbles..."
    end

    if poopy?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts "#{@name} does the potty dance..."
    end
  end

end

pet = Dragon.new
