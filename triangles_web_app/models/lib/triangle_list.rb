# TriangleList class

require 'forwardable'

class TriangleList
  extend Forwardable
  def_delegator :@list, :each, :each_list

  attr_reader :list
  def initialize(list_ = [])
    @list = list_
  end

  def add_triangle(triangle)
    @list << triangle
  end

  def all_triangles
    @list
  end

  def filter(min, max)
    @list.select { |triangle| triangle.area > min.to_f && triangle.area < max.to_f}
  end

  def triangles_by_area
    @list.sort_by(&:area)
  end
end