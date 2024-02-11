class Year2015
  class Day05
    class Line
      def initialize(input_line)
        @line = input_line
      end

      def nice?
        return false unless @line.match?(/[aeiou].*?[aeiou].*?[aeiou]/)
        return false unless @line.match?(/(.)\1/)
        return false if @line.match?(/(ab|cd|pq|xy)/)

        true
      end
    end

    class LinePartTwo < Line
      def nice?
        return false unless @line.match?(/(.{2}).*?\1/)
        return false unless @line.match?(/(.).\1/)

        true
      end
    end

    def initialize(input_file, input_part_one = false)
      @input = input_file
      @lines = input_file.chomp.split("\n").map do |input_line|
        (input_part_one ? Line : LinePartTwo).new(input_line)
      end
    end

    def to_i
      @lines.count(&:nice?)
    end
  end
end
