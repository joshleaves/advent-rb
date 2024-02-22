require 'digest'

class Year2016
  class Day05
    def initialize(input_data, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @input = input_data.chomp
    end

    def md5
      @md5 ||= Digest::MD5.new
    end

    def hash(str)
      md5.reset
      md5 << str
      md5.hexdigest
    end

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def build_code
      @code = '_' * 8
      added = 0
      0.upto(100**100) do |i|
        break if added == 8

        digest = hash("#{@input}#{i}")
        next unless digest.start_with?('0' * 5)

        if @version == 1
          @code[added] = digest[5]
          next added += 1
        end

        pos = digest[5].ord - 48
        next if pos.negative? || pos > 7 || @code[pos] != '_'

        code[pos] = digest[6]
        added += 1
      end
      @code
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

    def code
      @code ||= build_code
    end
  end
end
