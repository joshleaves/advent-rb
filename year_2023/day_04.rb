class Year2023
  class Day04
    attr_reader :version, :lines

    class Line
      attr_accessor :quantity

      def initialize(input_line)
        @line = input_line
        @winners = @line.split(':').last.split('|').first.scan(/\d+/).map(&:to_i)
        @inputs  = @line.split('|').last.scan(/\d+/).map(&:to_i)
        @quantity = 1
      end

      def winning_numbers
        (@winners & @inputs).sort
      end

      def to_i
        return 0 if winning_numbers.empty?

        2**(winning_numbers.length - 1)
      end
    end

    def initialize(input_file, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @lines = input_file.chomp.split("\n").map do |input_line|
        Line.new(input_line)
      end
      distribute_cards if version == 2
    end

    def distribute_cards
      @lines.each_with_index do |line, i|
        cards_won = line.winning_numbers.length
        1.upto(cards_won) do |j|
          next unless @lines[i + j]

          @lines[i + j].quantity += line.quantity
        end
      end
    end

    def to_i
      return @lines.sum(&:quantity) if version == 2

      @lines.sum(&:to_i)
    end
  end
end
