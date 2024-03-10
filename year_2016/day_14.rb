require 'digest'

class Year2016
  class Day14
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
      return md5.hexdigest if @version == 1

      digest = md5.hexdigest
      1.upto(2016) do
        md5.reset
        md5 << digest
        digest = md5.hexdigest
      end
      digest
    end

    def generate_hashes(starter, length)
      0.upto(length).map{|cnt| hash("#{@input}#{starter + cnt}") }
    end

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def to_i
      cnt = -1
      hash_queue = generate_hashes(0, 1000)
      keys = []
      loop do
        cnt += 1
        hash_queue.concat(generate_hashes(cnt, 1000)) if hash_queue.empty?
        digest = hash_queue.shift
        next unless digest =~ /(.)\1\1/

        letter = $1
        hash_queue.concat(generate_hashes(cnt + 1 + hash_queue.length, 1000 - hash_queue.length))
        0.upto(999) do |idx|
          next unless hash_queue[idx].include?(letter * 5)
          return cnt if keys.length == 63

          keys.push(digest)
          break
        end
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
  end
end
