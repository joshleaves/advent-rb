class Year2023
  class Day01
    attr_reader :input, :lines

    class Line
      def initialize(input_line)
        @line = input_line
      end

      def first_digit
        @line[/\d/]
      end

      def last_digit
        @line[/.*(\d).*?/, 1]
      end

      def to_i
        [first_digit, last_digit].join.to_i
      end
    end

    class LinePartTwo < Line
      NUMBERS = %w(zero one two three four five six seven eight nine).each_with_index.to_h{|num, i| [num, i.to_s] }.to_h

      def first_digit
        fd = @line[/\d|one|two|three|four|five|six|seven|eight|nine/]
        return fd if fd.match?(/\d/)

        NUMBERS[fd]
      end

      def last_digit
        ld = @line[/.*(\d|one|two|three|four|five|six|seven|eight|nine).*?$/, 1]
        return ld.to_s if ld.match?(/\d/)

        NUMBERS[ld].to_s
      end
    end

    def initialize(input_file, part_one = false)
      @input = input_file
      @lines = input_file.chomp.split("\n").map do |input_line|
        (part_one ? Line : LinePartTwo).new(input_line)
      end
    end

    def to_i
      @lines.sum(&:to_i)
    end
  end
end
