def get_num_validation(str)
    print "Enter #{str} > "
    num = gets 
    if (num != nil) 
        num = num.chomp().strip.to_i       
    else
        puts "Somrthing went wrong. Try to enter one more time"
        num = 0
    end
    return num
end

# print("Hello, world!")
puts("Hello, world!")

puts("What is your name?")
name = gets
puts("Hello, " + name)

puts("How old are you?")
age = get_num_validation("your age")
puts("I am #{age} too!")