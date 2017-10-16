# Objects
class Square
  def initialize(side_length)
    @side_length = side_length
  end

  def side_length
    @side_length
  end

  def side_length=(side_length)
    @side_length = side_length
  end

  def perimeter
    @side_length * 4
  end

  def area
    @side_length**2
  end

  def to_s
    "Side Length: #{@side_length}\nPerimeter: #{perimeter}\nArea: #{area}"
  end
end
my_square = Square.new(20)
puts my_square.side_length
my_square.side_length = 10
puts my_square.side_length

puts my_square
