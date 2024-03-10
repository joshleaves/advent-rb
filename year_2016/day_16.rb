class Year2016
  class Day16
    def initialize(input_data, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @input = input_data.chomp.chars.map do |char|
        char == '1'
      end
    end

    def expand_string(new_str)
      [new_str, [false], new_str.reverse.map(&:!)].inject(&:concat)
    end

    def checksum(string)
      string.each_slice(2).map do |lhs, rhs|
        lhs == rhs
      end
    end

    def to_s(disk_size)
      str = @input
      str = expand_string(str) until str.length >= disk_size
      str = str[0..disk_size - 1] if str.length >= disk_size
      str = checksum(str) until str.length.odd?
      str.map{|elt| elt ? '1' : '0' }.join
    end
  end
end
