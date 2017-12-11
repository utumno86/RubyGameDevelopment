require 'gosu'

class WhackaMole < Gosu::Window
  def initialize
    super(800,600)
    self.caption = "Wack a Mole"
    @mole = Gosu::Image.new('media/mole.png')
    @hammer = Gosu::Image.new('media/hammer.png')
    @x = 200
    @y = 200
    @width = 100
    @height = 75
    @velocity_x = 5
    @velocity_y = 5
    @visible = 0
    @hit = 0
    @font = Gosu::Font.new(30)
    @score = 0
    @playing = true
    @start_time = 0
  end

  def draw
    if @visible > 0
      @mole.draw(@x - @width / 2, @y - @height / 2, 1)
    end
    @hammer.draw(mouse_x - 25, mouse_y - 39, 1)
    if @hit == 0
      c = Gosu::Color::NONE
    elsif @hit == 1
      c = Gosu::Color::GREEN
    elsif @hit == -1
      c = Gosu::Color::RED
    end

    draw_quad(0, 0, c, 800, 0, c, 800, 600, c, 0, 600, c)
    @hit = 0
    @font.draw("Score: #{@score}", 650, 550, 2)
    @font.draw("Time Left: #{@time_left}", 50, 550, 2)
    unless @playing
      @font.draw("Game Over !!!!", 300, 300, 3)
      @visible = 20
      @time_left = 0
      @font.draw("Press Spacepar To Play Again", 170, 350, 3)
    end
  end

  def update
    if @playing == true
      @x += @velocity_x
      @y += @velocity_y
      @velocity_x *= -1 if @x + @width / 2 > 800 || @x - @width / 2 < 0
      @velocity_y *= -1 if @y + @height / 2 > 600 || @y - @height / 2 < 0
      @visible -= 1
      @visible = 30 if @visible < -10 && rand < 0.01
      @time_left = (60 - ((Gosu.milliseconds - @start_time) / 1000))
      @playing = false if @time_left < 0
    end
  end

  def button_down(id)
    if @playing == true
      if id == Gosu::MsLeft
        if Gosu.distance(mouse_x, mouse_y, @x, @y) < 50 && @visible >= 0
          @hit = 1
          @score += 10
        else
          @hit = -1
          @score -= 3
        end
      end
    elsif !@playing && id == Gosu::KbSpace
      @playing = true
      @visible = -10
      @start_time = Gosu.milliseconds
      @score = 0
    end
  end


end

window = WhackaMole.new
window.show
