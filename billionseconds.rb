# One billion seconds - Find out the exact second I was born
# Chapter 12.2 of Learn to Program by Chris Pine
# 201311116

puts 'This program calculates the date when you will turn 1 billion seconds old.'
puts "What day (dd) were you born?"
day = gets.chomp.to_i
puts 'What month (mm) were you born?'
month = gets.chomp.to_i
puts 'What year (yyyy) were you born?'
year = gets.chomp.to_i

birthdate = Time.local(year, month, day)
puts "You were born on #{birthdate}."
puts "One billion seconds after this date is on #{birthdate + 1000000000}"

# Calculate how old
year_now = Time.now.year
month_now = Time.now.month
day_now = Time.now.day

puts "You are #{year_now - year} years, #{month_now - month} months and 
      #{day_now - day} days old."