class Year2016
  class Day25
    class Program
      attr_accessor :instructions, :pc, :registers

      DEFAULT_REGISTERS = { 'a' => 0, 'b' => 0, 'c' => 0, 'd' => 0 }.freeze

      def initialize(input_instructions)
        @instructions = input_instructions.map do |instruction|
          [instruction, compile(instruction)]
        end
        @output_ok = true
        @output_cnt = 0
        @outputs = []
      end

      def dup
        Marshall.load(Marshall.dump(self))
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

      def out(value)
        value = @registers[value] || value.to_i
        case value
        when 0
          @outputs.push(value)
          return @output_ok = false unless @output_cnt.even?
        when 1
          @outputs.push(value)
          return @output_ok = false unless @output_cnt.odd?
        else
          return @output_ok = false
        end

        @output_cnt += 1
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
        when /^out (-?\d+|[abcd])$/
          [:out, $1]
        else
          raise "Invalid code: #{instruction}"
        end
      end
      # rubocop:enable Metrics/MethodLength

      def execute(init_registers = {})
        @pc = 0
        @registers = DEFAULT_REGISTERS.merge(init_registers)
        send(*instructions[@pc].last) while instructions[@pc] && @output_ok && @output_cnt < 10

        @output_ok
      end
    end

    def initialize(input_data)
      @input = input_data
    end

    def to_i
      0.upto(200) do |cnt|
        program = Program.new(@input.chomp.split("\n"))
        return cnt if program.execute('a' => cnt)
      end
    end
  end
end
