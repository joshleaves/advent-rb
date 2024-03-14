class Year2016
  class Day23
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
        return unless @registers[to]

        @registers[to] = @registers[from] || from.to_i
      end

      def jnz(value, jmp)
        return @pc += 1 if (@registers[value] || value.to_i).zero?

        @pc += @registers[jmp] || jmp.to_i
      end

      # rubocop:disable Metrics/MethodLength
      def tgl(register)
        jump = @registers[register] || jump.to_i
        code, tgl_instruction = @instructions[@pc + jump]
        return @pc += 1 unless tgl_instruction

        case tgl_instruction.length
        when 2
          tgl_instruction[0] = tgl_instruction[0] == :inc ? :dec : :inc
        when 3
          tgl_instruction[0] = tgl_instruction[0] == :jnz ? :cpy : :jnz
        end
        @instructions[@pc + jump] = [code, tgl_instruction]

        @pc += 1
      end

      def compile(instruction)
        case instruction
        when /^cpy (-?\d+|[abcd]) ([abcd])$/
          [:cpy, $1, $2]
        when /^inc ([abcd])$/
          [:inc, $1]
        when /^dec ([abcd])$/
          [:dec, $1]
        when /^jnz (-?\d+|[abcd]) (-?\d+|[abcd])$/
          [:jnz, $1, $2]
        when /^tgl ([abcd])$/
          [:tgl, $1]
        else
          raise "Invalid code: #{instruction}"
        end
      end
      # rubocop:enable Metrics/MethodLength

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
      @program.execute('a' => 7, 'b' => 0, 'c' => 0, 'd' => 0)
      @program.registers['a']
    end

    def part_two
      @program.execute('a' => 12, 'b' => 0, 'c' => 0, 'd' => 0)
      @program.registers['a']
    end
  end
end
