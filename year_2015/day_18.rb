class Year2015
  class Day18
    def initialize(input_data, input_part_one = false)
      input_data = input_data.chomp.split("\n")
      @size = input_data[0].length
      @version = input_part_one ? 1 : 2
      # @current_iteration_set = []
      # @current_text = input_data.each_with_index do |input_line, i|
      #   input_line.each_char.with_index do |input_char, j|
      #     @current_iteration_set.push([i, j]) if input_char == '#'
      #   end
      # end
      @current_text = input_data.map do |input_line|
        input_line.chars.map{|x| x == '#' }
      end
      add_corners if @version == 2
    end

    # def alive_now?(x_axis, y_axis)
    #   # return false if x_axis.negative? || x_axis >= @size
    #   # return false if y_axis.negative? || y_axis >= @size

    #   @current_iteration_set.include?([x_axis, y_axis])
    # end

    # def alive_neighbors_for(x_axis, y_axis)
    #   [
    #     [x_axis - 1, y_axis - 1], [x_axis, y_axis - 1], [x_axis + 1, y_axis - 1],
    #     [x_axis - 1, y_axis],                           [x_axis + 1, y_axis],
    #     [x_axis - 1, y_axis + 1], [x_axis, y_axis + 1], [x_axis + 1, y_axis + 1]
    #   ].count do |x, y|
    #     alive_now?(x, y)
    #   end
    # end
    #
    # def alive_next?(x_axis, y_axis)
    #   case alive_neighbors_for(x_axis, y_axis)
    #   when 3
    #     true
    #   when 2
    #     alive_now?(x_axis, y_axis)
    #   else
    #     false
    #   end
    # end
    #
    # def do_one_step
    #   @next_iteration_set = []
    #   0.upto(@size - 1) do |i|
    #     # puts "CHECK ITERATION #{i}"
    #     0.upto(@size - 1) do |j|
    #       @next_iteration_set.push([i, j]) if alive_next?(i, j)
    #     end
    #   end
    #   @current_iteration_set = @next_iteration_set
    # end
    #
    # def to_s
    #   0.upto(@size - 1).map do |i|
    #     0.upto(@size - 1).map do |j|
    #       alive_now?(i, j) ? '#' : '.'
    #     end.join
    #   end.join("\n")
    # end
    #
    # def to_i
    #   @current_iteration_set.length
    # end

    def cell_is_currently_alive?(x_axis, y_axis)
      return false if x_axis.negative?
      return false if y_axis.negative?
      return false unless @current_text[x_axis]
      return false unless @current_text[x_axis][y_axis]

      @current_text[x_axis][y_axis]
    end

    def alive_neighbors_for(x_axis, y_axis)
      [
        [x_axis - 1, y_axis - 1], [x_axis, y_axis - 1], [x_axis + 1, y_axis - 1],
        [x_axis - 1, y_axis],                           [x_axis + 1, y_axis],
        [x_axis - 1, y_axis + 1], [x_axis, y_axis + 1], [x_axis + 1, y_axis + 1]
      ].count do |x, y|
        cell_is_currently_alive?(x, y)
      end
    end

    def corner?(x_axis, y_axis)
      (x_axis.zero? || x_axis == (@size - 1)) && (y_axis.zero? || y_axis == (@size - 1))
    end

    def alive_next?(current_status, x_axis, y_axis)
      case alive_neighbors_for(x_axis, y_axis)
      when 3
        true
      when 2
        current_status == true
      else
        false
      end
    end

    def add_corners
      @current_text[0][0] = true
      @current_text[0][-1] = true
      @current_text[-1][0] = true
      @current_text[-1][-1] = true
    end

    def do_one_step
      @next_step_text = @current_text.each_with_index.map do |line, x_axis|
        line.each_with_index.map do |char, y_axis|
          alive_next?(char, x_axis, y_axis)
        end
      end
      @current_text = @next_step_text
      add_corners if @version == 2
    end

    def step(steps = 1)
      return if steps < 1

      1.upto(steps) do |_step_idx|
        do_one_step
      end
    end

    def to_i
      @current_text.flatten.count{|cell| cell == true }
    end

    def to_s
      @current_text.map do |line|
        line.map{|cell| cell ? '#' : '.' }.join
      end.join("\n")
    end
  end
end
