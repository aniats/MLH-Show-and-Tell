class MyComplex
    attr_reader :real, :imaginary

    def initialize(real, imaginary)
        @real = real
        @imaginary = imaginary
    end

    def add(other) 
        MyComplex.new(@real + other.real, @imaginary + other.imaginary)
    end

    def sub(other) 
        MyComplex.new(@real - other.real, @imaginary - other.imaginary)
    end

    def multiply(other) 
        r = @real * other.real - @imaginary * other.imaginary
        i = @imaginary * other.real + @real * other.imaginary
        MyComplex.new(r, i)
    end

    def divide(other) 
        square = other.real * other.real + other.imaginary * other.imaginary
        r = @real * other.real + @imaginary * other.imaginary
        i = @real * other.imaginary - @imaginary * other.real
        MyComplex.new(r / square, i / square)
    end

    def to_s
    	"#{@real} + i * #{@imaginary}"
    end

end