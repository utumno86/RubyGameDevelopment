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
end
my_square = Square.new(20)
puts my_square.side_length
my_square.side_length = 10
puts my_square.side_length
