class Year2016
  class Day04
    def initialize(input_data, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @input = input_data.chomp.split("\n")
    end

    def calculate_checksum(letters)
      letters.delete('-').each_char.uniq.sort_by do |char|
        [letters.count(char) * - 1, char]
      end.first(5).join
    end

    def translate_line(line, room_id)
      line.each_char.map do |char|
        next ' ' if char == '-'

        (((char.ord - 97 + room_id) % 26) + 97).chr
      end.join
    end

    def to_i
      @input.sum do |line|
        line.scan(/([\w-]+)-(\d+)\[(\w+)\]/)
        letters = $1
        value = $2.to_i
        checksum = $3
        next 0 unless checksum == calculate_checksum(letters)
        next value if @version == 1
        break value if translate_line(letters, value) == 'northpole object storage'

        0
      end
    end
  end
end
