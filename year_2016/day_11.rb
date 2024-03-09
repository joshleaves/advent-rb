class Year2016
  class Day11
    class << self
      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/BlockLength
      def next_moves(state)
        moves = []
        state.each_with_index do |item, idx|
          next if idx.zero?
          next if item != state[0]

          if state[0] < 3
            ns = state.dup
            ns[0] += 1
            ns[idx] += 1
            moves.push(ns) if state_is_safe?(ns)
            state.each_with_index do |item_in, idx_in|
              next if idx_in <= idx
              next if item_in != state[0]

              ns = state.dup
              ns[0] += 1
              ns[idx] += 1
              ns[idx_in] += 1
              moves.push(ns) if state_is_safe?(ns)
            end
          end

          next unless state[0] >= 1

          ns = state.dup
          ns[0] -= 1
          ns[idx] -= 1
          moves.push(ns) if state_is_safe?(ns)
          state.each_with_index do |item_in, idx_in|
            next if idx_in <= idx
            next if item_in != state[0]

            ns = state.dup
            ns[0] -= 1
            ns[idx] -= 1
            ns[idx_in] -= 1
            moves.push(ns) if state_is_safe?(ns)
          end
        end
        moves
      end
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/BlockLength

      def state_is_safe?(state)
        pairs = state[1..].each_slice(2)
        pairs.each_with_index do |pair_out, idx_out|
          next if pair_out[0] == pair_out[1]

          pairs.each_with_index do |pair_in, idx_in|
            next if idx_in == idx_out
            return false if pair_out[0] == pair_in[1]
          end
        end
        true
      end
    end

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
    def initialize(input_file, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @alltypes = []
      @chips = {}
      @gens = {}
      input_file.chomp.split("\n").each_with_index do |input_line, idx|
        next if input_line.match?(/contains nothing relevant.$/)

        input_line.scan(/(\w+)-compatible/).flatten.each do |chip|
          @chips[chip] = idx
        end
        input_line.scan(/(\w+) generator/).flatten.each do |gen|
          @gens[gen] = idx
        end
      end
      unless input_part_one
        @chips['elerium'] = 0
        @gens['elerium'] = 0
        @chips['dilithium'] = 0
        @gens['dilithium'] = 0
      end
      @alltypes = [[@chips.keys, @gens.keys].flatten.uniq * 2].flatten.sort
      @alltypes = ['E', @alltypes].flatten
      @initial_state = @alltypes.map.each_with_index do |type, idx|
        next 0 if type == 'E'

        (idx.odd? ? @chips : @gens)[type]
      end
      @cnt = 0
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity

    def search(states, moves_tried, depth)
      # puts "DEPTH: #{depth} => #{states.length} (#{moves_tried.length})"
      return depth if states.any?{|state| state.all?(3) }

      next_states = []
      states.sort.reverse_each do |state|
        next if moves_tried.include?(state)

        moves_tried.add(state)
        Day11.next_moves(state).each do |next_state|
          next_states.push(next_state) unless moves_tried.include?(next_state)
        end
      end
      search(next_states, moves_tried, depth + 1)
    end

    def solve
      search([@initial_state], Set.new, 0)
    end
  end
end
