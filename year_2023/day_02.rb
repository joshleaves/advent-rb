class Year2023
  class Day02
    attr_reader :input, :lines

    class Line
      attr_reader :line

      RED_MAX = 12
      RED_REG = /(\d+) red/.freeze
      GREEN_MAX = 13
      GREEN_REG = /(\d+) green/.freeze
      BLUE_MAX = 14
      BLUE_REG = /(\d+) blue/.freeze
      ID_REG = /^Game (\d+):/.freeze

      def initialize(input_line)
        @line = input_line
      end

      def too_many_red?
        @line.scan(RED_REG).flatten.map(&:to_i).any?{|red| red > RED_MAX }
      end

      def too_many_green?
        @line.scan(GREEN_REG).flatten.map(&:to_i).any?{|green| green > GREEN_MAX }
      end

      def too_many_blue?
        @line.scan(BLUE_REG).flatten.map(&:to_i).any?{|blue| blue > BLUE_MAX }
      end

      def line_is_valid?
        return false if too_many_red?
        return false if too_many_green?
        return false if too_many_blue?

        true
      end

      def to_i
        return 0 unless line_is_valid?

        @line[ID_REG, 1].to_i
      end
    end

    class LinePartTwo < Line
      def red
        @line.scan(RED_REG).flatten.map(&:to_i).max
      end

      def green
        @line.scan(GREEN_REG).flatten.map(&:to_i).max
      end

      def blue
        @line.scan(BLUE_REG).flatten.map(&:to_i).max
      end

      def to_i
        red * green * blue
      end
    end

    def initialize(input_file, part_one = false)
      @input = input_file
      @lines = input_file.chomp.split("\n").map do |input_line|
        (part_one ? Line : LinePartTwo).new(input_line)
      end
    end

    def to_i
      @lines.map(&:to_i).inject(&:+)
    end
  end
end
