# Class Orange Tree
# Chapter 13.6 from Learn to Program by Chris Pine
# 20131119

class OrangeTree

  def initialize
    @tree_height = 0
    @tree_age = 0
    @orange_count = 0
    @picked = false
  end

  def height
    puts "The tree is currently #{@tree_height} metres tall."
    if @tree_height == 10
      puts 'The orange tree has grown to its maximum height.'
    end
  end

  def count_the_oranges
    puts "The tree has #{@orange_count} oranges."
  end

  def pick_an_orange
    @picked = true
    if @orange_count == 0
      puts 'There is currently no orange fruit in the tree.'
    else
      puts 'You have picked an orange. It was delicious!'
      @orange_count = @orange_count - 1
      puts "There are #{@orange_count} left."
    end
  end

  def one_year_passes
    @tree_age = @tree_age + 1
    puts 'One year has passed.'

    # The tree growing tall:
    if @tree_height <= 10
      @tree_height = @tree_height + 2
    end

    # The tree bearing fruit, the older, the more it bears fruits
    if @tree_age > 2
      @orange_count = @orange_count + 2
    end
    if @tree_age > 3
      @orange_count = @orange_count + 2
    end
    if @tree_age > 4
      @orange_count = @orange_count + 2
    end
    # if oranges were not picked
    if !@picked && @orange_count > 0
      @orange_count = @orange_count - 1
    end
    # Death of the tree
    if @tree_age == 7
      puts 'The tree has grown too old. It died happy knowing it bore many oranges.'
      exit
    end
  end
end

orangesaft = OrangeTree.new
orangesaft.height
orangesaft.count_the_oranges
orangesaft.one_year_passes
orangesaft.height
orangesaft.pick_an_orange
orangesaft.count_the_oranges
orangesaft.one_year_passes
orangesaft.height
orangesaft.count_the_oranges
orangesaft.one_year_passes
orangesaft.one_year_passes
orangesaft.pick_an_orange
orangesaft.one_year_passes
orangesaft.one_year_passes
orangesaft.height
orangesaft.count_the_oranges
orangesaft.one_year_passes
orangesaft.one_year_passes
orangesaft.one_year_passes
orangesaft.one_year_passes