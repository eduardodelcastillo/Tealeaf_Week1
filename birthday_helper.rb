# Birthday Helper
# This read in names and birth dates from a text file. It will ask for a name
# and the program will display the corresponding birthdate.
# Chapter 12.6 Learn to Program by Chris Pine
# 20131118

Dir.chdir '/Users/jobdelcastillo/Tealeaf_Week1'
# The file with the birthdates
filename = 'birthday.rtf'
# Info store in hashes for simple retrieval
birth_dates = {}
File.read(filename).each_line do |line| # reads each line of the file
  line = line.chomp # chomp the end of line 
  # Need to account for comma as the end of the name 
  counter = 0
  while line[counter] != ',' && counter < line.length
    name = line[0..counter] # this gets up to comma as while will end when it encounters comma
    date = line[-12..-1] # this gets the date (counting from the right)
    # put this in hash
    birth_dates[name] = date
    counter = counter + 1
  end
end

puts 'Whose birthday would you like to know?'
name = gets.chomp
date = birth_dates[name]

if date == nil
  puts 'Oooh, I don\'t know that one...'
else
  puts date[0..5] # telling the day and month only
end

