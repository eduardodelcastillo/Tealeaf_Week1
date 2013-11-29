#HW9 Pass by Reference vs value
# 20131107

def some_method(obj)
	#obj.uniq # uniq method does not change the arr reference - pass by value
	obj.uniq!  #uniq! method changes the arr reference - pass by reference
	# Therefore Ruby is both, can be either pass by reference or value depending on the method called
end

arr = [1, 0, 2, 2,3,4,4]
some_method(arr)
puts arr
