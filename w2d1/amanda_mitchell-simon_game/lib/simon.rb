class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over == true
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    sleep(2)
    system('clear')
    require_sequence

    unless game_over == true
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    input_sequence = []
    until input_sequence.length == @seq.length
      puts "Enter a color (red, blue, green or yellow)"
      input = gets.chomp.downcase
      input_sequence << input

      input_sequence.each_index do |i|
        unless input_sequence[i] == @seq[i]
          @game_over = true
          return
        end
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
    puts "Simon added #{seq.last} to the sequence."
  end

  def round_success_message
    puts "Good job. Time for the next round!"
  end

  def game_over_message
    puts "You lose. Your score was #{sequence_length - 1}."
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1
  end
end
