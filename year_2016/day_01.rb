class Year2016
  class Day01
    DIRECTIONS = %w(N E S W).freeze

    def initialize(input_data, input_part_one = false)
      @input = input_data
      @version = input_part_one ? 1 : 2
      @direction = 0
      @position = [0, 0]
      @visited = [[0, 0]]
      do_all_moves(input_data)
    end

    def do_all_moves(instructions)
      instructions.split(', ').each do |instruction|
        one_turn(instruction[0])
        moves = instruction.scan(/\d+/)[0].to_i
        next one_move(moves) if @version == 1

        1.upto(moves) do
          one_move(1)
          @visited.include?(@position) ? break : @visited.push(@position.dup)
        end
        break if @visited[..-2].include?(@position)
      end
    end

    def one_turn(leftright)
      @direction = (@direction + 4 + (leftright == 'L' ? -1 : 1)) % 4
    end

    def one_move(moves)
      case DIRECTIONS[@direction]
      when 'N'
        @position[1] -= moves
      when 'E'
        @position[0] += moves
      when 'S'
        @position[1] += moves
      when 'W'
        @position[0] -= moves
      end
    end

    def to_i
      [@position[0], @position[1]].sum(&:abs)
    end
  end
end
