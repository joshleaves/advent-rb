class Year2015
  class Day07
    attr_accessor :wires

    class Wire
      attr_accessor :input

      def initialize(name)
        @name = name
        @to_i = nil
      end

      def to_i
        @to_i ||= @input.to_i
      end
    end

    class LogicalGate
      def initialize(*inputs)
        @inputs = inputs
      end

      class AND < LogicalGate
        def to_i
          @inputs[0].to_i & @inputs[1].to_i
        end
      end

      class OR < LogicalGate
        def to_i
          @inputs[0].to_i | @inputs[1].to_i
        end
      end

      class LSHIFT < LogicalGate
        def to_i
          @inputs[0].to_i << @inputs[1].to_i
        end
      end

      class RSHIFT < LogicalGate
        def to_i
          @inputs[0].to_i >> @inputs[1].to_i
        end
      end

      class NOT < LogicalGate
        def to_i
          65535 ^ @inputs[0].to_i
        end
      end
    end

    # No way in hell.
    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
    def create_gate(input_line)
      case input_line
      when /(\w+) OR (\w+) -> (\w+)/
        wires[$3].input = LogicalGate::OR.new(wires[$1], wires[$2])
      when /(\d+) AND (\w+) -> (\w+)/
        wires[$3].input = LogicalGate::AND.new($1, wires[$2])
      when /(\w+) AND (\w+) -> (\w+)/
        wires[$3].input = LogicalGate::AND.new(wires[$1], wires[$2])
      when /(\w+) LSHIFT (\d+) -> (\w+)/
        wires[$3].input = LogicalGate::LSHIFT.new(wires[$1], $2)
      when /(\w+) RSHIFT (\d+) -> (\w+)/
        wires[$3].input = LogicalGate::RSHIFT.new(wires[$1], $2)
      when /NOT (\w+) -> (\w+)/
        wires[$2].input = LogicalGate::NOT.new(wires[$1])
      when /(\d+) -> (\w+)/
        wires[$2].input = $1
      when /(\w+) -> (\w+)/
        wires[$2].input = wires[$1]
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength

    def initialize(input_file, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @wires = Hash.new{|hash, key| hash[key] = Wire.new(key) }
      input_file.chomp.split("\n").each do |line|
        create_gate(line)
      end
    end
  end
end
