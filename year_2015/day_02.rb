class Year2015
  class Day02
    attr_reader :part_one

    class Line
      attr_reader :line, :numbers

      def initialize(input_line)
        @line = input_line
        @numbers = @line.split('x').map(&:to_i).sort
      end

      def height
        numbers[0]
      end

      def width
        numbers[1]
      end

      def length
        numbers[2]
      end

      def area_small
        height * width
      end

      def area_med
        width * length
      end

      def area_large
        length * height
      end

      def to_i
        [
          3 * area_small,
          2 * area_med,
          2 * area_large
        ].sum
      end
    end

    class LinePartTwo < Line
      def to_i
        [
          height * 2,
          width * 2,
          height * width * length
        ].sum
      end
    end

    def initialize(input_file, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @input = input_file
      @lines = input_file.chomp.split("\n").map do |input_line|
        (@version == 1 ? Line : LinePartTwo).new(input_line)
      end
    end

    def to_i
      @lines.sum(&:to_i)
    end
  end
end
