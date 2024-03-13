class Year2016
  class Day18
    def initialize(input_data, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @input = input_data.chomp.chars.map do |char|
        char == '.'
      end
    end

    def to_i(len)
      safe_tiles_cnt = @input.count(true)
      1.upto(len - 1) do |_idx|
        @input = @input.map.each_with_index do |_char, idx|
          left = idx.zero? ? true : @input[idx - 1]
          right = @input[idx + 1].nil? ? true : @input[idx + 1]
          left == right
        end

        safe_tiles_cnt += @input.count(true)
      end
      safe_tiles_cnt
    end
  end
end
