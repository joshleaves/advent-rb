class Year2023
  class Day03
    attr_reader :input, :lines, :version

    class Line
      attr_reader :line

      def initialize(input_line)
        @line = input_line
      end

      def find_group_length(idx)
        return 0 unless @line[idx]
        return 0 unless @line[idx] =~ /\d/

        1 + find_group_length(idx + 1)
      end

      def range_got_symbol?(idx_from, idx_to)
        range = @line[idx_from, idx_to]
        range = range.gsub(/\d|\./, '')
        range.length.positive?
      end

      def erase_range(idx, number_part_length)
        0.upto(number_part_length - 1) do |i|
          @line[idx + i] = '.'
        end
      end

      def number_part_is_island?(idx, number_part_length, above, below)
        diagonal_left  = idx.zero? ? idx : idx - 1
        diagonal_right = idx.zero? ? number_part_length + 1 : number_part_length + 2

        range_above = above&.range_got_symbol?(diagonal_left, diagonal_right)
        range_below = below&.range_got_symbol?(diagonal_left, diagonal_right)
        range_left = idx.zero? ? false : range_got_symbol?(idx - 1, 1)
        range_right = range_got_symbol?(idx + number_part_length, 1)

        [range_above, range_below, range_left, range_right].any?(true)
      end

      def cleanup(previous_line, next_line)
        idx = 0
        while @line[idx]
          next idx += 1 unless @line[idx] =~ /\d/

          number_part_length = find_group_length(idx)
          got_match = number_part_is_island?(idx, number_part_length, previous_line, next_line)
          erase_range(idx, number_part_length) unless got_match

          idx += number_part_length
        end
      end

      def to_i
        @line.scan(/\d+/).map(&:to_i).inject(&:+) || 0
      end
    end

    class LinePartTwo < Line
      attr_reader :numbers

      def initialize(input_line, line_idx)
        super(input_line)
        @numbers = []
        @line_idx = line_idx
      end

      def range_got_symbol?(idx_from, idx_to)
        return false if idx_from.negative?

        range = @line[idx_from, idx_to]
        range.index('*')
      end

      def find_gears_vertical(above, below, diagonal_left, diagonal_right)
        [
          above&.range_got_symbol?(diagonal_left, diagonal_right),
          below&.range_got_symbol?(diagonal_left, diagonal_right)
        ]
      end

      def find_gears_horizontal(idx, number_part_length)
        [
          range_got_symbol?(idx - 1, 1),
          range_got_symbol?(idx + number_part_length, 1)
        ]
      end

      def calculate_diagonals(idx, number_part_length)
        [
          idx.zero? ? idx : idx - 1,
          idx.zero? ? number_part_length + 1 : number_part_length + 2
        ]
      end

      def number_part_is_island?(idx, number_part_length, above, below)
        diagonal_left, diagonal_right = calculate_diagonals(idx, number_part_length)

        gear_above, gear_below = find_gears_vertical(above, below, diagonal_left, diagonal_right)
        gear_left, gear_right = find_gears_horizontal(idx, number_part_length)
        return false unless [gear_above, gear_below, gear_left, gear_right].any?{|x| x.is_a?(Numeric) }

        add_gears_vertical(line[idx, number_part_length].to_i, diagonal_left, gear_above, gear_below)
        add_gears_horizontal(line[idx, number_part_length].to_i, idx, number_part_length, gear_left, gear_right)
        true
      end

      def add_gears_vertical(number, diagonal_left, gear_above, gear_below)
        numbers << [number, [@line_idx - 1, diagonal_left + gear_above]] if gear_above
        numbers << [number, [@line_idx + 1, diagonal_left + gear_below]] if gear_below
      end

      def add_gears_horizontal(number, idx, number_part_length, gear_left, gear_right)
        numbers << [number, [@line_idx, idx - 1]] if gear_left
        numbers << [number, [@line_idx, idx + number_part_length]] if gear_right
      end
    end

    def initialize(input_file, part_one = false)
      @version = part_one ? 1 : 2
      @input = input_file
      @lines = input_file.chomp.split("\n").map.each_with_index do |input_line, line_idx|
        (@version == 1 ? Line.new(input_line) : LinePartTwo.new(input_line, line_idx))
      end
      @lines.each_with_index do |line, i|
        line.cleanup(i.zero? ? nil : @lines[i - 1], @lines[i + 1])
      end
    end

    def to_i
      return to_i_v2 if @version == 2

      @lines.map(&:to_i).compact.inject(&:+)
    end

    def to_i_v2
      all_lines = @lines.map(&:numbers).inject(&:+).group_by(&:last)
      all_lines.map do |_position, values|
        next 0 unless values.length == 2

        values[0].first * values[1].first
      end.inject(&:+)
    end
  end
end
