class Year2015
  class Day06
    CAPTURE_ONE = /(turn on|turn off|toggle) (\d+,\d+) through (\d+,\d+)/.freeze

    def modify_lines(from, to, &_block)
      from_x, from_y = from.split(',').map(&:to_i)
      to_x, to_y = to.split(',').map(&:to_i)
      from_x.upto(to_x) do |i|
        extracted = @lights[i][from_y..to_y]
        @lights[i][from_y..to_y] = yield extracted
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

    def interpret_line(input_line)
      action, from, to = input_line.match(CAPTURE_ONE).to_a[1..]
      case action
      when 'turn on'
        modify_lines(from, to){|arr| turn_on(arr) }
      when 'turn off'
        modify_lines(from, to){|arr| turn_off(arr) }
      when 'toggle'
        modify_lines(from, to){|arr| toggle(arr) }
      end
    end

    def initialize(input_file, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @lights = Array.new(1000){ Array.new(1000, @version == 1 ? false : 0) }
      input_file.chomp.split("\n").each do |line|
        interpret_line(line)
      end
    end

    def to_i
      return @lights.flatten.count(true) if @version == 1

      @lights.flatten.sum
    end
  end
end
