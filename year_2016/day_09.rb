class Year2016
  class Day09
    attr_accessor :lines

    # rubocop:disable Metrics/AbcSize,  Metrics/MethodLength
    def expand_line(input_line)
      i = 0
      result = []
      while i < input_line.length
        case input_line[i..]
        when /^(\w+)/
          result.push($1)
          i += $1.length
        when /^(\((\d+)x(\d+)\))/
          full = $1.length
          duration = $2.to_i
          repeat = $3.to_i
          dup_elt = input_line[(i + full)..(i + full + duration - 1)]
          dup_elt = expand_line(input_line[(i + full)..(i + full + duration - 1)]) if @version == 2
          1.upto(repeat){|_j| result.push(dup_elt) }
          i += full + duration
        end
      end
      result.join
    end
    # rubocop:enable Metrics/AbcSize,  Metrics/MethodLength

    def initialize(input_file, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @input = input_file
      @lines = input_file.chomp.split("\n").map do |input_line|
        expand_line(input_line)
      end
    end

    def to_s
      lines.join
    end

    def to_i
      lines.sum(&:length)
    end
  end
end
