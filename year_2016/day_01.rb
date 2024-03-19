class Year2016
  class Day01
    DIRECTIONS = %w(N E S W).freeze

    def initialize(input_data, input_part_one = false)
      @input = input_data
      @version = input_part_one ? 1 : 2
      @direction = 0
      @position = [0, 0]
      @visited = Set.new([0, 0])
      do_all_moves(input_data)
    end

    # rubocop:disable Lint/NonLocalExitFromIterator
    def do_all_moves(instructions)
      instructions.split(', ').each do |instruction|
        @direction = (@direction + (instruction[0] == 'L' ? 3 : 5)) % 4
        moves = instruction[1..].to_i
        next one_move(moves) if @version == 1

        1.upto(moves) do
          one_move(1)
          return if @visited.include?(@position)

          @visited.add(@position.dup)
        end
      end
    end
    # rubocop:enable Lint/NonLocalExitFromIterator

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
