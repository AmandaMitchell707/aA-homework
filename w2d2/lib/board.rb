class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_index do |i|
      unless i == 6 || i == 13
        4.times do
          cups[i] << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    if current_player == @player1
      raise 'Invalid starting cup' unless 0 <= start_pos && start_pos <= 5
    else
      raise 'Invalid starting cup' unless 7 <= start_pos && start_pos <= 12
    end

    raise 'Starting cup is empty' if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    #start_pos -= 1 if start_pos <= 6

    num_stones = cups[start_pos].count
    pos = start_pos + 1

    num_stones.times do
      case current_player.side
      when 2
        pos += 1 if pos == 6
      when 1
        pos += 1 if pos == 13

      end
      cups[pos] << :stone
      pos += 1
    end


    cups[start_pos] = []
    render
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
  end

  def winner
    player1_score = cups[6].count
    player2_score = cups[13].count

    return :draw if player1_score == player2_score

    if player1_score > player2
      return player1.name
    else
      return player2.name
    end
  end
end
