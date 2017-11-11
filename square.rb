# Objects
class Square
  attr_accessor :side_length

  def initialize(side_length)
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

  def draw
    puts '*' * @side_length
    (@side_length - 2).times do
      print "*  #{' ' * (@side_length - 2)}*\n"
    end
    puts '*' * @side_length
  end
end
my_square = Square.new(25)

puts my_square

my_square.draw
