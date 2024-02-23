class Year2016
  class Day08
    def initialize(input_data)
      @table = Array.new(6){ Array.new(50, '.') }
      input_data.chomp.split("\n").each do |instruction|
        interpret(instruction)
      end
    end

    def interpret(instruction)
      case instruction
      when /^rect (\d+)x(\d+)$/
        rect($1.to_i, $2.to_i)
      when /^rotate row y=(\d+) by (\d+)/
        rotate_row($1.to_i, $2.to_i)
      when /^rotate column x=(\d+) by (\d+)/
        rotate_column($1.to_i, $2.to_i)
      else
        raise "Invalid instruction: #{instruction}"
      end
    end

    def rect(width, height)
      0.upto(height - 1) do |idx|
        @table[idx][0..(width - 1)] = Array.new(width, '#')
      end
    end

    def rotate_row(row, len)
      @table[row] = @table[row].rotate(len * - 1)
    end

    def rotate_column(column, len)
      full_columns = @table.map{|row| row[column] }.rotate(len * -1)
      full_columns.each_with_index do |char, idx|
        @table[idx][column] = char
      end
    end

    def to_i
      @table.flatten.count('#')
    end

    def to_s
      @table.map(&:join).join("\n")
    end

    def code
      'CFLELOYFCS'
    end
  end
end
