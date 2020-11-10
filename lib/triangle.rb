class Triangle

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end  

  def kind
    sides = [@a, @b, @c]
    if (@a + @b) <= @c || (@c + @b) <= @a || (@c + @a) <= @b || sides.any? {|side| side <= 0}
      raise TriangleError
    elsif sides.all? {|side| side == sides[1]} 
      :equilateral
    elsif sides.uniq.count == 2
      :isosceles
    else
      :scalene
    end  
  end  

  class TriangleError < StandardError
    def message
      "The lengths provided cannot make a triangle"
    end  
  end

end 