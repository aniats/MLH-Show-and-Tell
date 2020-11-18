# frozen_string_literal: true

# Triangle Class
class Triangle
  attr_reader :first, :second, :third, :s

  def initialize(first_, second_, third_)
    @first = first_
    @second = second_
    @third = third_
    @s = area
  end

  def triangle?
    if @first + @second > @third &&
       @first + @third > @second &&
       @second + @third > @first
      true
    else
      false
    end
  end

  def area
    if triangle?
      p = (@first + @second + @third) / 2
      @s = Math.sqrt(p * (p - @first) * (p - @second) * (p - @third))
    else
      @s = 0
    end
  end
end