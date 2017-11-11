require 'gosu'

class Tutorial < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "My Awesome Gosu Tutorial"
  end

  def update
  end

  def draw
  end
end

Tutorial.new.show
