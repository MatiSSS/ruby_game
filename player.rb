class Player
  def initialize(glowa_image)
    @image = Gosu::Image.new(glowa_image)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def accelerate(sign)
    @vel_x += sign * Gosu::offset_x(@angle, 0.5)
    @vel_y += sign * Gosu::offset_y(@angle, 0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y

    if(@x > 640)
      @x = 0
    end

    if(@x < 0)
      @x = 640
    end

    if(@y > 480)
      @y = 0
    end

    if(@y < 0)
      @y = 480
    end

    puts "@x: #{@x.round}, @y: #{@y.round}"


    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  ZMNIESZ_RAZY = 3
  def draw
    @image.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, 1.0/ZMNIESZ_RAZY, 1.0/ZMNIESZ_RAZY)
  end
end