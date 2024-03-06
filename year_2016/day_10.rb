class Year2016
  class Day10
    class Bot
      attr_accessor :id, :values, :low, :high

      def initialize(input_id)
        @id = input_id
        @values = []
      end

      def add_chip(chip)
        values.push(chip.to_i)
        values.sort!
      end

      def set_low_high(input_low, input_high)
        @low = input_low
        @high = input_high
      end

      def extract_chips
        raise 'No chips to extract' unless values.length >= 2

        ex_low = [values.shift, low]
        ex_high = [values.shift, high]
        [ex_low, ex_high]
      end
    end

    class Output
      attr_accessor :values

      def initialize
        @values = []
      end
    end

    def initialize(input_file, input_part_one = false)
      @version = input_part_one ? 1 : 2
      input_file.chomp.split("\n").map do |input_line|
        case input_line
        when /^value (\d+) goes to bot (\d+)$/
          bots[$2.to_i].add_chip($1)
        when /^bot (\d+) gives low to (\w+ \d+) and high to (\w+ \d+)$/
          bots[$1.to_i].set_low_high($2, $3)
        end
      end
    end

    def bots
      @bots ||= Hash.new{|hash, key| hash[key] = Bot.new(key) }
    end

    def outputs
      @outputs ||= Hash.new{|hash, key| hash[key] = Output.new }
    end

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
    def solve(lhs, rhs)
      bots_to_check = bots.select{|_key, bot| bot.values.length >= 2 }
      until bots_to_check.empty?
        bots_to_check.each_value do |bot|
          return bot.id.to_i if @version == 1 && [lhs, rhs].sort == bot.values.sort

          bot.extract_chips.each do |chip, extract|
            case extract
            when /^bot (\d+)$/
              bots[$1.to_i].add_chip(chip)
            when /^output (\d+)$/
              outputs[$1.to_i].values.push(chip)
            else
              raise "Invalide input: #{input_line}"
            end
          end
        end

        bots_to_check = bots.select{|_key, bot| bot.values.length >= 2 }
      end

      [outputs[0], outputs[1], outputs[2]].flatten.map(&:values).flatten.inject(&:*)
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
  end
end
