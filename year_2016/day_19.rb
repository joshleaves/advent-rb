class Year2016
  class Day19
    def initialize(input_data, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @input = input_data.chomp.to_i
    end

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def solve
      return @input.to_s(2).chars.rotate(1).join.to_i(2) if @version == 1

      # Nice trick from https://pastebin.com/Zm7tLbAe
      mid = (@input + 1.0) / 2
      arr_v1 = Array.new(mid.floor - 1){|i| i + 1 }
      arr_v2 = Array.new(mid.ceil.to_i){|i| mid + i }

      loop do
        if arr_v2.length >= arr_v1.length
          arr_v2.shift
          return arr_v1.first if arr_v2.empty?
        else
          arr_v1.pop
        end
        arr_v1.push(arr_v2.shift)
        arr_v2.push(arr_v1.shift)
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
  end
end
