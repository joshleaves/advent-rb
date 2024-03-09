class Year2016
  class Day12
    attr_accessor :program

    class Program
      attr_accessor :instructions, :pc, :registers

      def initialize(input_instructions)
        @instructions = input_instructions.map do |instruction|
          [instruction, compile(instruction)]
        end
      end

      def inc(register)
        @pc += 1
        @registers[register] += 1
      end

      def dec(register)
        @pc += 1
        @registers[register] -= 1
      end

      def cpy(from, to)
        @pc += 1
        @registers[to] = registers[from] || from.to_i
      end

      def jnz(value, jmp)
        return @pc += 1 if (@registers[value] || value.to_i).zero?

        @pc += jmp.to_i
      end

      def compile(instruction)
        case instruction
        when /^cpy (-?\d+|[abcd]) ([abcd])$/
          [:cpy, $1, $2]
        when /^inc ([abcd])$/
          [:inc, $1]
        when /^dec ([abcd])$/
          [:dec, $1]
        when /^jnz (-?\d+|[abcd]) (-?\d+)$/
          [:jnz, $1, $2]
        end
      end

      def execute(init_registers = { 'a' => 0, 'b' => 0, 'c' => 0, 'd' => 0 })
        @pc = 0
        @registers = init_registers

        send(*instructions[@pc].last) while instructions[@pc]
      end
    end

    def initialize(input_data)
      @program = Program.new(input_data.chomp.split("\n"))
    end

    def part_one
      @program.execute
      @program.registers['a']
    end

    def part_two
      @program.execute('a' => 0, 'b' => 0, 'c' => 1, 'd' => 0)
      @program.registers['a']
    end
  end
end
