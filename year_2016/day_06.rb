class Year2016
  class Day06
    def initialize(input_data, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @input = input_data.chomp.split("\n").map do |line|
        line.each_char.to_a
      end
    end

    def code
      @code ||= begin
        @code = ''
        until @input[0].empty?
          last_row = @input.map(&:pop)
          letters = last_row.uniq.sort_by{|letter| last_row.count(letter) }
          @code.prepend(letters.send(@version == 1 ? :last : :first))
        end
        @code
      end
    end
  end
end
