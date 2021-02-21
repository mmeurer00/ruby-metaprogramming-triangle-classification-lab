class Triangle
  attr_reader :length1, :length2, :length3
  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end

  def kind
    real_triangle
    if length1 == length2 && length2 == length3
      return :equilateral
    elsif length1 == length2 || length2 == length3 || length1 == length3
      return :isosceles
    else length1 != length2 && length2 != length3
      return :scalene
    end
  end

  def real_triangle
    lengths = [length1, length2, length3]
    equalities = [(length1 + length2 > length3), (length2 + length3 > length1), (length1 + length3 > length2)]
    lengths.each do |side|
      equalities << false if side <= 0
    raise TriangleError if equalities.include?(false)
    end
  end

  class TriangleError < StandardError
    puts "Triangle Error!"
  end
end
