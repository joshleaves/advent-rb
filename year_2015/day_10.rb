class Year2015
  class Day10
    def iterations(desired_iteration = 0)
      return @current_data if desired_iteration < @iteration

      look_and_say while @iteration < desired_iteration
      @current_data
    end

    def look_and_say
      @current_data = @current_data.each_with_object([0, @current_data[0]]) do |char, memo|
        if char == memo[-1]
          memo[-2] += 1
          next memo
        end
        memo.push(1, char)
        memo
      end.flatten

      @iteration += 1
    end

    def initialize(input_data)
      @iteration = 0
      @current_data = input_data.chars.map(&:to_i)
    end

    def to_s(desired_iteration = -1)
      iterations(desired_iteration).map(&:to_s).join
    end

    def to_i(desired_iteration = -1)
      iterations(desired_iteration)
      @current_data.length
    end
  end
end
