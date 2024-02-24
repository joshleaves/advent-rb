require 'digest'

class Year2015
  class Day04
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

    def to_i
      0.upto(100**100) do |i|
        return i if hash("#{@input}#{i}").start_with?('0' * (@version + 4))
      end
    end
  end
end
