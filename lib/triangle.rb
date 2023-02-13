class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    sides = [@side1, @side2, @side3].sort
    # sorting the sides to arrange them in order

    # finding any <=0 side 
    raise TriangleError if sides.any? { |side| side <= 0 }

    # making sure sum of any two sides are more than the third side
    raise TriangleError unless (sides[0] + sides[1]) > sides[2]

    # find unique values to remove any equals
    sides.uniq!
    if sides.count == 1
      :equilateral
    elsif sides.count == 2
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    # triangle error code
    def error_message
      "this is not a valid triangle"
    end
  end
end
