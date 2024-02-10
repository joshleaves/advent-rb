class Year2015
  class Day11
    class Password
      def initialize(input_password)
        @password = input_password
      end

      def first_criteria?
        @password.chars.map(&:ord).each_cons(3) do |str|
          return true if str[0] + 1 == str[1] && str[1] == str[2] - 1
        end
        false
      end

      def second_criteria?
        return false if @password.include?('i')
        return false if @password.include?('o')
        return false if @password.include?('l')

        true
      end

      def third_criteria?
        return false if @password.chars.uniq.length > 6
        return false unless (scan = @password.scan(/(.)\1/))

        scan.uniq.length > 1
      end

      def valid?
        first_criteria? && second_criteria? && third_criteria?
      end

      def to_s
        @password
      end
    end

    def cleanup_iol(problematic_char, next_input)
      idx = next_input.index(problematic_char)
      next_input[idx..] = "#{problematic_char.next}#{'a' * (next_input.length - (idx + 1))}"
      next_input
    end

    def next_password
      next_input = @password.to_s.next
      next_input = cleanup_iol('i', next_input) if next_input.include?('i')
      next_input = cleanup_iol('o', next_input) if next_input.include?('o')
      next_input = cleanup_iol('l', next_input) if next_input.include?('l')
      next_input = next_input.next if next_input.chars.uniq.length > 6

      next_input
    end

    def initialize(input_data)
      @password = Password.new(input_data.next)
    end

    def to_s
      @password = Password.new(next_password) until @password.valid?
      @password.to_s
    end
  end
end
