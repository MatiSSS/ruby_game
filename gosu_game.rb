require 'gosu'

WERSJE = {
  kacper: {
    tlo: 'obrazki/jebacts.png',
    glowa: 'obrazki/kacper.png',
  },
  mateusz: {
    tlo: 'obrazki/cracovia.jpg',
    glowa: 'obrazki/mateusz.png'
  }
}

WERSJA = WERSJE.fetch(:kacper)

require_relative 'player'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Gosu Tutorial Game"

    @background_image = Gosu::Image.new(WERSJA.fetch(:tlo), :tileable => true)

    @player = Player.new(WERSJA.fetch(:glowa))
    @player.warp(200, 240)
  

    @player2 = Player.new(WERSJE.fetch(:mateusz).fetch(:glowa))
    @player2.warp(400, 240)
  end

  def update # zmien cos na planszy
    if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::MsLeft then
      @player.turn_left
      @player2.turn_right
    end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::MsRight then
      @player.turn_right
      @player2.turn_left
    end
    if Gosu::button_down? Gosu::KbUp then
      @player.accelerate(1)
      @player2.accelerate(2)
    end
    if Gosu::button_down? Gosu::KbDown then
      @player.accelerate(-1)
      @player2.accelerate(-2)
    end

    @player.move
    @player2.move
  end

  def draw # narysuj wszystko od nowa
    @player.draw
    @player2.draw
    @background_image.draw(0, 0, 0);
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = GameWindow.new
window.show
