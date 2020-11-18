# Practise triangle and circle

def get_value(str)
    print "Enter #{str} >"
    num = gets 
    if (num != nil) 
        num = num.chomp().strip.to_f
        return num
    else
        puts "Something went wrong. Try to enter one more time"
        side_of_triangle(str)
    end
end

a = get_value("first side of triangle")
b = get_value("second side of triangle")
c = get_value("third side of triangle")
r = get_value("radius of a circle")

p = (a + b + c) / 2
s_of_triangle = Math.sqrt(p * (p - a) * (p - b) * (p - c))
s_of_circle = 3/14 * r * r

if (s_of_circle <= s_of_triangle) 
    puts "We can insert triangle into circle"
else
    puts "We cannot insert triangle into circle. Triangle is bigger than circle"
end