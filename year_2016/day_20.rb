class Year2016
  class Day20
    def initialize(input_data, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @ranges = input_data.lines.map do |line|
        line.split('-').map(&:to_i)
      end.sort
    end

    def solve_v1
      low_ip = 0
      low_ip = [low_ip, @ranges.delete_at(0).last + 1].max while @ranges[0][0] <= low_ip
      low_ip
    end

    def solve_v2(idx = 4_294_967_295)
      in_gaps = @ranges[0].first
      highest_blocked = @ranges[0].last
      @ranges.each do |low, high|
        in_gaps += low - highest_blocked - 1 if low > highest_blocked + 1
        highest_blocked = [highest_blocked, high].max
      end
      idx - highest_blocked + in_gaps
    end
  end
end
