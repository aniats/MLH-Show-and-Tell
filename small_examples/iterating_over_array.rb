# Iterators
# The iterator is the collection method that receives the block
# By collection we mean both built-in array and hash classes, and classes created by users
# Collections support many iterators


# A few examples for very useful iterators:

# 1
animals = %w(ant bee cat dog)
animals.each { |animal| puts animal }

# 2
print("\n")
3.upto(6) { |number| print number }

# 3
print("\n")
('a'..'e').each { |character| print character }


# 4
data = [5, 66, 13, 24, 46]

print("\n")
print("Iterating over array: ")
data.each_with_index do |number, index|
    puts "#{index}: #{number}"
end

# Do all elements satisfy the condition: are they odd?
res =  data.all? { |number| number.odd? }
p res

# Create a new array based on the current: squares of numbers
res =  data.map { |number| number**2 }
p res

# Sum of array
res =  data.reduce { |memo, number| number + memo }
p res

# Choose all elements more than 40
res =  data.select { |number| number > 40 }
p res