class Year2015
  class Day15
    PROPERTIES = %i[capacity durability flavor texture].freeze

    class Ingredient
      attr_reader :name, :capacity, :durability, :flavor, :texture, :calories
      attr_accessor :forbidden

      INGREDIENT_RE = /^(\w+): capacity (-?\d+), durability (-?\d+), flavor (-?\d+), texture (-?\d+), calories (-?\d+)$/

      def initialize(input_line)
        input_line =~ INGREDIENT_RE
        @name       = $1
        @capacity   = $2.to_i
        @durability = $3.to_i
        @flavor     = $4.to_i
        @texture    = $5.to_i
        @calories   = $6.to_i
        @forbidden  = 100
      end
    end

    def initialize(input_data, input_part_one = false)
      @input_file = input_data
      @version = input_part_one ? 1 : 2
      @ingredients = input_data.chomp.split("\n").map do |input_line|
        Ingredient.new(input_line)
      end
      mark_forbidden_ranges
    end

    def calculate_forbidden_range(positive, negative)
      1.upto(100).flat_map do |idx|
        next idx if ((idx * negative) + ((100 - idx) * positive)).negative?
      end.compact.min
    end

    def mark_forbidden_ranges_for_property(prop, positive)
      @ingredients.select{|ingredient| ingredient.send(prop).negative? }.each do |ingredient|
        other_forbidden = calculate_forbidden_range(positive, ingredient.send(prop)) - 1
        ingredient.forbidden = [ingredient.forbidden, other_forbidden].min
      end
    end

    def mark_forbidden_ranges
      PROPERTIES.each do |prop|
        next unless @ingredients.map(&prop).any?(&:negative?)

        positive = @ingredients.map(&prop).select(&:positive?).sum
        mark_forbidden_ranges_for_property(prop, positive)
      end
    end

    def calculate(quantities, symbol)
      total = quantities.each_with_index.sum do |quantity, i|
        quantity * @ingredients[i].send(symbol)
      end
      [0, total].max
    end

    def score(quantities)
      PROPERTIES.map do |symbol|
        calculate(quantities, symbol)
      end.inject(&:*)
    end

    def quantities_enumerator
      Enumerator.new do |yielder|
        quantities = Array.new(@ingredients.length, 1)
        quantities[-1] = 101 - quantities.sum
        loop do
          quantities = update_quantities(quantities, -1)
          next if @version == 2 && calculate(quantities, :calories) != 500

          yielder << quantities
        end
      end
    end

    def increment_quantity(quantities, idx)
      quantities[idx] += 1
      quantities[idx] = 100 - (quantities.sum - quantities[idx]) if idx == -1 && quantities.sum < 100
      quantities[idx] = 100 if quantities[idx] > @ingredients[idx].forbidden
    end

    def update_quantities(quantities, idx = -1)
      raise StopIteration if quantities[idx].nil?

      increment_quantity(quantities, idx)
      if quantities.sum > 100
        quantities[idx] = 1
        update_quantities(quantities, idx - 1)
        quantities[idx] = 101 - quantities.sum if idx == -1
      end

      quantities
    end

    def to_i
      @to_i ||= begin
        @to_i = 0
        quantities_enumerator.each do |quantities|
          @to_i = [score(quantities), @to_i].max
        end
        @to_i
      end
    end
  end
end
