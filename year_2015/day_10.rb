class Year2015
  class Day10
    def initialize(input_data)
      @current_data = input_data.chars.map(&:to_i)
    end

    def iterate(desired_iteration)
      1.upto(desired_iteration) do
        look_and_say
      end
    end

    def look_and_say
      i = 0
      result = []
      while i < @current_data.length
        current = @current_data[i]
        j = i + 1
        j += 1 while current == @current_data[j]

        result << (j - i) << current
        i = j
      end
      @current_data = result
    end

    def to_s(desired_iteration)
      iterate(desired_iteration)
      @current_data.map(&:to_s).join
    end

    def to_i(desired_iteration)
      iterate(desired_iteration)
      @current_data.length
    end
  end
end
