require 'gosu'

class Ball

  def initialize(window)
    @image =  Gosu::Image.new(window, "ball.png", false)
    @x = @y = 50
    @vx = 5
    @vy = 5
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def move
    @x += @vx
    @y += @vy
    if @x > 640
      @vx = -5
    end

    if @y > 480
      @vy = -5
    end
  end

end

class MyWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = 'Hello World!'
    @bouncing_ball = Ball.new(self)
    # @background_image = Gosu::Image.new(self, "vaporwave-bg.png", true)
  end

  def update
    @bouncing_ball.move
  end

  def draw
    @bouncing_ball.draw
  end
end

window = MyWindow.new
window.show
