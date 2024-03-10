require 'digest'

class Year2016
  class Day17
    DIRS = [
      [0, -1, 'U'],
      [0, 1, 'D'],
      [-1, 0, 'L'],
      [1, 0, 'R']
    ].freeze
    DOORS = %w(b c d e f).freeze

    def initialize(input_data, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @input = input_data.chomp
      @seen = Set.new
    end

    def md5
      @md5 ||= Digest::MD5.new
    end

    def hash(str)
      md5.reset
      md5 << str
      md5.hexdigest
    end

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
    def to_s
      queue = [[0, 0, '']]
      loop do
        pos_x, pos_y, path = queue.shift
        return path if pos_x == 3 && pos_y == 3

        hash("#{@input}#{path}")[0..3].chars.each_with_index do |door, idx|
          mod_x, mod_y, pth_l = DIRS[idx]
          new_x = pos_x + mod_x
          new_y = pos_y + mod_y
          next if new_x.negative? || new_x > 3 || new_y.negative? || new_y > 3
          next unless DOORS.include?(door)

          queue.push([new_x, new_y, "#{path}#{pth_l}"])
        end
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
    def to_i
      queue = [[0, 0, '']]
      ans = 0
      loop do
        return ans if queue.empty?

        pos_x, pos_y, path = queue.shift
        if pos_x == 3 && pos_y == 3
          ans = path.length if path.length > ans
          next
        end
        dig = hash("#{@input}#{path}")[0..3]
        dig.chars.each_with_index do |door, idx|
          mod_x, mod_y, pth_l = DIRS[idx]
          new_x = pos_x + mod_x
          new_y = pos_y + mod_y
          next if new_x.negative? || new_x > 3 || new_y.negative? || new_y > 3
          next unless DOORS.include?(door)

          queue.push([new_x, new_y, "#{path}#{pth_l}"])
        end
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
  end
end
