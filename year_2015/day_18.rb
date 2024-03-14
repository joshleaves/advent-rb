class Year2015
  class Day18
    CORNERS = [
      [0, 0],
      [0, -1],
      [-1, 0],
      [-1, -1]
    ].freeze

    def initialize(input_data, input_part_one = false)
      input_data = input_data.chomp.split("\n")
      @size = input_data[0].length
      @version = input_part_one ? 1 : 2
      @current_text = input_data.map do |input_line|
        input_line.chars.map{|x| x == '#' }
      end
      add_corners if @version == 2
    end

    def alive_neighbors_for_updown(x_axis, y_axis)
      return 0 if x_axis.negative? || x_axis >= @size

      from = [0, y_axis - 1].max
      to = [@size - 1, y_axis + 1].min
      @current_text[x_axis][from..to].count(true)
    end

    def alive_neighbors_for_lr(x_axis, y_axis)
      cells = []
      cells << @current_text[x_axis][y_axis - 1] unless y_axis.zero?
      cells << @current_text[x_axis][y_axis + 1] unless y_axis + 1 >= @size
      cells.count(true)
    end

    def alive_neighbors_for_alt(x_axis, y_axis)
      [
        alive_neighbors_for_updown(x_axis - 1, y_axis),
        alive_neighbors_for_lr(x_axis, y_axis),
        alive_neighbors_for_updown(x_axis + 1, y_axis)
      ].sum
    end

    def add_corners
      CORNERS.each do |x_axis, y_axis|
        @current_text[x_axis][y_axis] = true
      end
    end

    def do_one_step
      @current_text = @current_text.each_with_index.map do |line, x_axis|
        line.each_with_index.map do |char, y_axis|
          neighbors = alive_neighbors_for_alt(x_axis, y_axis)
          next true if neighbors == 3
          next char if neighbors == 2

          false
        end
      end
    end

    def step(steps = 1)
      return if steps < 1

      1.upto(steps) do
        do_one_step
        add_corners if @version == 2
      end
    end

    def to_i
      @current_text.sum{|line| line.count(true) }
    end

    def to_s
      @current_text.map do |line|
        line.map{|cell| cell ? '#' : '.' }.join
      end.join("\n")
    end
  end
end
