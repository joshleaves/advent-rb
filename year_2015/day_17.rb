class Year2015
  class Day17
    def initialize(input_data, input_part_one = false)
      @input_file = input_data
      @version = input_part_one ? 1 : 2
      @containers = input_data.chomp.split("\n").map(&:to_i).sort.reverse
    end

    def build_combinations(yielded, containers_left, compound_values)
      return yielded << compound_values if compound_values.sum == 150
      return nil if compound_values.sum > 150
      return nil if containers_left.empty?

      containers_left.each_with_index.map do |value, i|
        build_combinations(yielded, containers_left[(i + 1)..], [compound_values, value].flatten)
      end
    end

    def solutions
      Enumerator.new do |yielded|
        start = 0
        loop do
          raise StopIteration if @containers[start..].sum < 150

          build_combinations(yielded, @containers[(start + 1)..], [@containers[start]])
          start += 1
        end
      end
    end

    def to_i
      return solutions.to_a.length if @version == 1

      all_solutions = solutions.group_by(&:length)
      all_solutions[all_solutions.keys.min].length
    end
  end
end
