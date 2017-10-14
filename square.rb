# Objects
class Square
  def initialize(side_length)
    @side_length = side_length
  end
end
my_square = Square.new(20)
puts my_square.inspect
