class Year2016
  class Day15
    def initialize(input_data, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @discs = input_data.chomp.split("\n").map do |input_line|
        input_line.scan(/\d+/).map(&:to_i)
      end
    end

    def to_i
      @discs.push([@discs.length + 1, 11, 0, 0]) if @version == 2
      period = 1
      time = 0

      @discs.each do |disc, npos, _stime, spos|
        time += period until ((time + disc + spos) % npos).zero?
        period *= npos
      end
      time
    end
  end
end
