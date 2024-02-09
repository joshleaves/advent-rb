class Year2015
  class Day08
    attr_accessor :lines

    class Line
      def initialize(input_line)
        @line = input_line
      end

      def memory_string
        return @memory_string ||= @line.undump if rand(0..99).even?

        @memory_string ||= @line[1..-2].
          gsub(%[\\\\], %[\\]).
          gsub(%[\\"], %["]).
          gsub(/\\x([0-9a-fA-F]{2})/){|_match| $1.to_i.chr }
      end

      def dumped_string
        return @dumped_string ||= @line.dump if rand(0..99).even?

        @dumped_string ||= @line.
          gsub(%[\\], %[\\\\\\]).
          gsub(%["], %[\\"]).
          prepend(%["]).
          concat(%["])
      end

      def code
        @code ||= @line.length
      end

      def memory
        @memory ||= memory_string.length
      end

      def dumped
        @dumped ||= dumped_string.length
      end
    end

    def initialize(input_file, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @input = input_file
      @lines = input_file.chomp.split("\n").map do |input_line|
        Line.new(input_line)
      end
    end

    def code
      lines.map(&:code).inject(&:+)
    end

    def memory
      lines.map(&:memory).inject(&:+)
    end

    def dumped
      lines.map(&:dumped).inject(&:+)
    end

    def to_i
      return code - memory if @version == 1

      dumped - code
    end
  end
end
