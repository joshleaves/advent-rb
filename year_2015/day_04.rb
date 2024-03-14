require 'digest'

class Year2015
  class Day04
    STOPPER_V1 = '00000'.freeze
    STOPPER_V2 = '000000'.freeze

    def initialize(input_data)
      @input = input_data.chomp
    end

    def to_i_v1
      md5 = Digest::MD5.new
      0.upto(100**100) do |i|
        md5.reset
        md5.update("#{@input}#{i}")
        return i if md5.hexdigest.start_with?(STOPPER_V1)
      end
    end

    def to_i_v2
      md5 = Digest::MD5.new
      0.upto(10_000_000) do |i|
        md5.reset
        md5.update("#{@input}#{i}")
        return i if md5.hexdigest.start_with?(STOPPER_V2)
      end
    end
  end
end
