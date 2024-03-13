class Year2016
  class Day21
    def initialize(input_data, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @instructions = input_data.lines.map do |instruction|
        compile_instruction(instruction.chomp)
      end
    end

    # rubocop:disable Metrics/MethodLength
    def compile_instruction(instruction)
      case instruction
      when /^swap position (\d+) with position (\d+)$/
        [:swap_positions, $1.to_i, $2.to_i]
      when /^swap letter (\w) with letter (\w)$/
        [:swap_letters, $1, $2]
      when /^rotate (\bleft\b|\bright\b) (\d+) steps?$/
        [:"rotate_#{$1}", $2.to_i]
      when /^rotate based on position of letter (\w)$/
        [:rotate_based_on, $1]
      when /^reverse positions (\d+) through (\d+)$/
        [:reverse, $1.to_i, $2.to_i]
      when /^move position (\d+) to position (\d+)$/
        [:move, $1.to_i, $2.to_i]
      else
        raise "Unknown instruction: #{instruction}"
      end
    end
    # rubocop:enable Metrics/MethodLength

    def swap_positions(from, to)
      @password[from], @password[to] = @password[to], @password[from]
    end

    def swap_letters(from, to)
      @password.gsub!(from, '_')
      @password.gsub!(to, from)
      @password.gsub!('_', to)
    end

    def reverse(from, to)
      @password[from..to] = @password[from..to].reverse
    end

    def _rotate(input, steps)
      input.chars.rotate(steps).join
    end

    def rotate_left(steps)
      @password = _rotate(@password, @version == 1 ? steps : steps * -1)
    end

    def rotate_right(steps)
      @password = _rotate(@password, @version == 2 ? steps : steps * -1)
    end

    def move(from, to)
      from, to = to, from if @version == 2
      pass_arr = @password.chars
      extract = pass_arr.delete_at(from)
      pass_arr.insert(to, extract)
      @password = pass_arr.join
    end

    def _rotate_based_on(input, index)
      index = input.index(index)
      index += index >= 4 ? 2 : 1
      _rotate(input, index * -1)
    end

    def rotate_based_on(index)
      return @password = _rotate_based_on(@password, index) if @version == 1

      1.upto(@password.length) do |i|
        str = _rotate(@password, i * - 1)
        return @password = str if _rotate_based_on(str, index) == @password
      end
      raise 'NOT FOUND'
    end

    def solve(input_password)
      @password = input_password
      @instructions.send(@version == 2 ? :reverse_each : :each) do |instruction|
        send(*instruction)
      end
      @password
    end
  end
end
