require_relative 'my_complex'

puts "Class for complex numbers with 4 basic arithmetic operations: add, sub, multiply, divide."
lhs = MyComplex.new(3.0, -7.0);
rhs = MyComplex.new(2.0, 6.0);
puts lhs.divide(rhs)
