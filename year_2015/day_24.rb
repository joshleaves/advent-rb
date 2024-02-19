class Year2015
  class Day24
    def initialize(input_data, input_part_one = false)
      @input_file = input_data
      @version = input_part_one ? 1 : 2
      @numbers = input_data.chomp.split("\n").map(&:to_i).sort
      @magic_number = @numbers.sum / (input_part_one ? 3 : 4)
    end

    def find_answer
      combos = 1.upto(@numbers.length) do |i|
        results = @numbers.combination(i).select do |arr|
          arr.sum == @magic_number
        end
        next if results.empty?
        break results if results.length.positive?
      end
      combos.map{|combo| combo.inject(&:*) }.min
    end

    def to_i
      find_answer
    end
  end
end
