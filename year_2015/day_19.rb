class Year2015
  class Day19
    attr_accessor :starter, :molecules

    RE_MOLECULE = /^(\w+) => (\w+)$/

    def initialize(input_data, input_part_one = false)
      @version = input_part_one ? 1 : 2
      input_data = input_data.chomp.split("\n").reject(&:empty?)
      @starter = input_data.pop
      @molecules = {}
      input_data.map do |input_line|
        input_line =~ RE_MOLECULE
        @molecules[$1] ||= []
        @molecules[$1].push($2)
        [$1, $2]
      end
    end

    def do_permutations(input, replacements)
      re_input = /(#{input})/
      parts = starter.scan(re_input).length
      replacements.each do |replacement|
        0.upto(parts - 1) do |idx|
          new_str = starter.gsub(re_input).each_with_index do |_part, i|
            idx == i ? replacement : input
          end
          @permutations.push(new_str)
        end
      end
    end

    def permutations
      @permutations ||= begin
        @permutations = []
        @molecules.each do |input, replacements|
          do_permutations(input, replacements)
        end
        @permutations.sort.uniq
      end
    end

    def to_i
      @to_i ||= permutations.uniq.length
    end

    def count_str(symbol)
      @starter.scan(/#{symbol}/).length
    end

    def build_molecule
      @starter.scan(/[A-Z]/).length - count_str('Rn') - count_str('Ar') - (2 * count_str('Y')) - 1
    end
  end
end
