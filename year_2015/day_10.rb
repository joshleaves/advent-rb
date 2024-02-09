class Year2015
  class Day10
    def iterations(desired_iteration = -1)
      look_and_say until @inner_iterations.length > desired_iteration
      @inner_iterations[desired_iteration]
    end

    def look_and_say
      starter = @inner_iterations.last
      next_iteration = starter.each_char.with_object([starter[0], 0]) do |char, memo|
        if char == memo[-2]
          memo[-1] += 1
          next memo
        end
        memo.push(char, 1)
        memo
      end.each_slice(2).map(&:reverse).flatten.map(&:to_s).join

      @inner_iterations.push(next_iteration)
    end

    def initialize(input_data)
      @inner_iterations = [input_data]
    end

    def to_i(desired_iteration = -1)
      iterations(desired_iteration).length
    end
  end
end
