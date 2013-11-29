#Variable Scope
# 20131107

num1 = gets.chomp
num2 = gets.chomp
arr = [1,2,3]
arr.each do |x|
	invar = 3+6
	puts num1 # ok to access local variable in an inner scope
end
# puts invar # Cannot use variable from an inner scope in do end