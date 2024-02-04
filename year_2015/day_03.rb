class Year2015
  class Day03
    attr_reader :part_one
    attr_accessor :santa, :robot

    def initialize(input_file, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @input = input_file

      @houses = [[0, 0]]
      @santa = [0, 0]
      @robot = [0, 0]
    end

    def move(key, move_direction)
      character = send(key).dup
      case move_direction
      when '>', '<'
        character[0] += move_horizontal(move_direction)
      when 'v', '^'
        character[1] += move_vertical(move_direction)
      end
      send("#{key}=", character)
    end

    def move_horizontal(move_direction)
      move_direction == '>' ? 1 : -1
    end

    def move_vertical(move_direction)
      move_direction == '^' ? 1 : -1
    end

    def to_i
      @input.chars.each_slice(2) do |move_char_one, move_char_two|
        # Move Santa
        move(:santa, move_char_one)
        @houses.push(santa)

        # Move Santa, or Robot
        second_move_char = @version == 1 ? :santa : :robot
        move(second_move_char, move_char_two)
        @houses.push(send(second_move_char))
      end
      @houses.uniq.length
    end
  end
end
