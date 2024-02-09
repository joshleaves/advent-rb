class Year2015
  class Day09
    attr_accessor :version, :paths

    def try_next_city(current_city, cities, current_path, current_best)
      return current_path if version == 1 && current_best < current_path
      return current_path if cities.empty?

      best_path = current_best
      cities.each do |next_city|
        new_path = paths[[current_city, next_city].sort]
        new_best = try_next_city(next_city, cities - [next_city], current_path + new_path, best_path)
        best_path = [best_path, new_best].compact.send(@version == 1 ? :min : :max)
      end

      best_path
    end

    def worst_path
      @worst_path ||= @version == 1 ? paths.values.inject(&:+) : 0
    end

    def best_path
      @best_path ||= begin
        best_path = worst_path
        cities.each do |starter_city|
          new_best = try_next_city(starter_city, cities - [starter_city], 0, worst_path)
          best_path = [best_path, new_best].send(@version == 1 ? :min : :max)
        end
        best_path
      end
    end

    def cities
      @cities ||= paths.keys.flatten.uniq.sort
    end

    def initialize(input_file, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @paths = {}
      input_file.chomp.split("\n").map do |input_line|
        input_line =~ /^(\w+) to (\w+) = (\d+)$/
        paths[[$1, $2].sort] = $3.to_i
      end
    end

    def to_i
      best_path
    end
  end
end
