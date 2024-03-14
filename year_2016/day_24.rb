class Year2016
  class Day24
    attr_accessor :max_x, :max_y, :max_num

    # rubocop:disable Metrics/MethodLength
    def initialize(input_data, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @input = input_data.chomp.split("\n")
      @max_x = @input[0].length
      @max_y = @input.length
      @max_num = 0
      @input = @input.join.chars.map do |char|
        next true if char == '.'
        next false if char == '#'

        @max_num = [@max_num, char.to_i].max
        char.to_i
      end
      @distances = {}
    end
    # rubocop:enable Metrics/MethodLength

    def safe_passage?(pos_x, pos_y)
      @input[pos_x + (pos_y * max_x)] != false
    end

    def position_of(number)
      idx = @input.index(number)
      [idx % max_x, (idx / max_x)]
    end

    EXPAND = [[0, 1], [0, -1], [1, 0], [-1, 0]].freeze

    # rubocop:disable Metrics/AbcSize,  Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
    def bfs(start, stop)
      seen = Set.new
      queue = [[start, 0]]
      until queue.empty?
        pos, steps = queue.shift
        next if seen.include?(pos)
        return steps if pos == stop

        seen.add(pos)
        EXPAND.each do |add_x, add_y|
          next_x = pos[0] + add_x
          next_y = pos[1] + add_y
          correct_x = next_x >= 0 && next_x <= max_x
          correct_y = next_y >= 0 && next_y <= max_y
          next unless correct_x && correct_y
          next unless safe_passage?(next_x, next_y)

          queue.push([[next_x, next_y], steps + 1])
        end
      end
      raise 'NOPE'
    end
    # rubocop:enable Metrics/AbcSize,  Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity

    def numbers
      @numbers ||= (0..max_num).to_a
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
    def shortest_path(pos, done, todo, path, best_path)
      return if path > best_path
      return path + distance(pos, 0) if todo.empty? && @version == 2
      return path if todo.empty? && @version == 1

      todo.each do |next_pos|
        next_done = done + [next_pos]
        next_todo = todo - [next_pos]
        next_dist = distance(pos, next_pos)
        next_path = shortest_path(next_pos, next_done, next_todo, path + next_dist, best_path)
        best_path = [best_path, next_path].min if next_path
      end
      best_path
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength

    def distance(from, to)
      @distances[[from, to].sort]
    end

    def calculate_distances
      numbers.combination(2) do |combo|
        combo.sort!
        dist = bfs(position_of(combo[0]), position_of(combo[1]))
        @distances[combo] = dist
      end
    end

    def to_i
      calculate_distances
      best_path = 1000
      numbers[1..].each do |next_pos|
        next_done = [0, next_pos]
        next_todo = numbers - next_done
        next_path = shortest_path(next_pos, next_done, next_todo, distance(0, next_pos), best_path)
        best_path = [best_path, next_path].min if next_path
      end
      best_path
    end
  end
end
