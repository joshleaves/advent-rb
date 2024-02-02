class Year2015
  class Day01
    attr_reader :part_one

    def initialize(input_file, input_part_one = false)
      @input = input_file
      @part_one = input_part_one
    end

    def to_i
      return complicated_to_i unless part_one

      @input.count('(') - @input.count(')')
    end

    def complicated_to_i
      idx = 0
      level = 0
      while @input[idx]
        level += 1 if @input[idx] == '('
        level -= 1 if @input[idx] == ')'
        idx += 1

        return idx if level.negative?
      end
    end
  end
end
