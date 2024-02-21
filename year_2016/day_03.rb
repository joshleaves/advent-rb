class Year2016
  class Day03
    # rubocop:disable Metrics/CyclomaticComplexity
    def initialize(input_data, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @triplets = input_data.split("\n").map do |line|
        line.scan(/\d+/).map(&:to_i)
      end
      return if @version == 1

      tre = @triplets.map(&:pop)
      two = @triplets.map(&:pop)
      one = @triplets.map(&:pop)
      @triplets = (one + two + tre).each_slice(3)
    end
    # rubocop:enable Metrics/CyclomaticComplexity

    def to_i
      @triplets.map(&:sort).count do |sides|
        (sides[0] + sides[1]) > sides[2]
      end
    end
  end
end
