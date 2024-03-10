class Year2016
  class Day13
    class << self
      def next_moves(state)
        [
          [state[0] - 1, state[1]],
          [state[0] + 1, state[1]],
          [state[0], state[1] - 1],
          [state[0], state[1] + 1]
        ].reject do |x, y|
          x.negative? || y.negative?
        end
      end
    end

    def initialize(input_favorite, input_x, input_y, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @favorite = input_favorite
      @reach_x = input_x
      @reach_y = input_y
    end

    def cell_value(pos_x, pos_y)
      [
        (pos_x * pos_x),
        (3 * pos_x),
        (2 * pos_x * pos_y),
        pos_y,
        (pos_y * pos_y)
      ].sum
    end

    def cell_is_a_wall?(pos)
      (cell_value(pos[0], pos[1]) + @favorite).to_s(2).chars.count('1').odd?
    end

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
    def search(states, moves_tried, moves)
      return moves if @version == 1 && states.any?([@reach_x, @reach_y])
      return moves_tried.count{|pos| !cell_is_a_wall?(pos) } if @version == 2 && moves == 51

      next_states = []
      states.each do |state|
        next if moves_tried.include?(state)

        moves_tried.add(state)
        next if cell_is_a_wall?(state)

        Day13.next_moves(state).each do |next_state|
          next_states.push(next_state) unless moves_tried.include?(next_state)
        end
      end
      search(next_states, moves_tried, moves + 1)
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity

    def to_i
      search([[1, 1]], Set.new, 0)
    end
  end
end
