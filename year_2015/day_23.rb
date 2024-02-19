class Year2015
  class Day23
    attr_accessor :program

    class Program
      attr_accessor :instructions, :pc, :registers

      def initialize(input_instructions)
        @instructions = input_instructions.map do |instruction|
          [instruction, interpret(instruction)]
        end
      end

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Style/Semicolon
      def interpret(instruction)
        case instruction
        when /^(hlf|tpl|inc) ([ab])$/
          action = $1
          reg = $2
          case action
          when 'hlf'
            proc{ @pc += 1; @registers[reg] = @registers[reg] / 2 }
          when 'tpl'
            proc{ @pc += 1; @registers[reg] *= 3 }
          when 'inc'
            proc{ @pc += 1; @registers[reg] += 1 }
          end
        when /^jmp ([+-]?\d+)$/
          offset = $1.to_i
          proc{ @pc += offset }
        when /^ji([eo]) ([ab]), ([\+\-]\d+)$/
          even_or_one = $1 == 'e'
          reg = $2
          offset = $3.to_i
          proc do
            move_offset = (even_or_one && @registers[reg].even?) || (!even_or_one && @registers[reg] == 1)
            @pc += move_offset ? offset : 1
          end
        else
          raise "Invalid instruction: #{instruction}"
        end
      end
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Style/Semicolon

      def execute(init_registers = { 'a' => 0, 'b' => 0 })
        @pc = 0
        @registers = init_registers

        instance_eval(&instructions[@pc].last) while instructions[@pc]
      end
    end

    def initialize(input_data)
      @program = Program.new(input_data.chomp.split("\n"))
    end

    def part_one
      @program.execute
      @program.registers['b']
    end

    def part_two
      @program.execute('a' => 1, 'b' => 0)
      @program.registers['b']
    end
  end
end
