class Lampada
  attr_reader :on

  def initialize(on: true)
    @on = on
  end

  def turn_on
    puts 'acessa'
  end

  def turn_off
    puts 'desligada'
  end
end

class Button
	def poll
		lamp = Lampada.new(on: false)

    if lamp.on
			lamp.turn_off
		else
			lamp.turn_on
    end

  end
end

button = Button.new
button.poll

