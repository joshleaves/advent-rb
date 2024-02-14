class Year2015
  class Day20
    attr_accessor :house_gifts

    def initialize(input_starter, input_data, input_part_one = false)
      # @starter = input_starter
      @target  = input_data
      @version = input_part_one ? 1 : 2
      @total_gifts = 0
      @houses = [0, input_starter - 1].max
    end

    def divisors_of(number)
      value = 0
      1.upto(number**0.5) do |n|
        next unless (number % n).zero?

        n2 = (number / n).floor
        value += n if @version == 1 || n2 < 50
        value += n2 if n2 != n && (@version == 1 || n < 50)
      end
      value
    end

    def to_i
      loop do
        @houses += 1
        elves = divisors_of(@houses) * (@version == 1 ? 10 : 11)
        return @houses if elves >= @target
      end
    end
  end
end
