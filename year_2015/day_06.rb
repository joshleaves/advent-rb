class Year2015
  class Day06
    CAPTURE_ONE = /(\bturn on\b|\bturn off\b|\btoggle\b) (\d+,\d+) through (\d+,\d+)/

    def initialize(input_file, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @lights = Array.new(1000){ Array.new(1000, @version == 1 ? false : 0) }
      input_file.chomp.split("\n").each do |line|
        action, from, to = line.match(CAPTURE_ONE).to_a[1..]
        modify_lines(action.tr(' ', '_'), from, to)
      end
    end

    def modify_lines(action, from, to)
      from_x, from_y = from.split(',').map(&:to_i)
      to_x, to_y = to.split(',').map(&:to_i)
      from_x.upto(to_x) do |i|
        @lights[i][from_y..to_y] = send(action, @lights[i][from_y..to_y])
      end
    end

    def turn_on(arr)
      return Array.new(arr.length, true) if @version == 1

      arr.map{|x| x + 1 }
    end

    def turn_off(arr)
      return Array.new(arr.length, false) if @version == 1

      arr.map{|x| [0, x - 1].max }
    end

    def toggle(arr)
      return arr.map(&:!) if @version == 1

      arr.map{|x| x + 2 }
    end

    def to_i
      return @lights.sum{|line| line.count(true) } if @version == 1

      @lights.sum(&:sum)
    end
  end
end
