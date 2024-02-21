class Year2016
  class Day02
    # Reminder:
    # 1 2 3
    # 4 5 6
    # 7 8 9
    BUTTONS_V1 = {
      '1' => { 'R' => '2', 'D' => '4' },
      '2' => { 'L' => '1', 'R' => '3', 'D' => '5' },
      '3' => { 'L' => '2', 'D' => '6' },
      '4' => { 'U' => '1', 'R' => '5', 'D' => '7' },
      '5' => { 'U' => '2', 'L' => '4', 'R' => '6', 'D' => '8' },
      '6' => { 'L' => '5', 'U' => '3', 'D' => '9' },
      '7' => { 'R' => '8', 'U' => '4' },
      '8' => { 'L' => '7', 'R' => '9', 'U' => '5' },
      '9' => { 'L' => '8', 'U' => '6' }
    }.freeze

    # Reminder:
    #     1
    #   2 3 4
    # 5 6 7 8 9
    #   A B C
    #     D
    BUTTONS_V2 = {
      '1' => { 'D' => '3' },

      '2' => { 'R' => '3', 'D' => '6' },
      '3' => { 'L' => '2', 'U' => '1', 'D' => '7', 'R' => '4' },
      '4' => { 'L' => '3', 'D' => '8' },

      '5' => { 'R' => '6' },
      '6' => { 'U' => '2', 'L' => '5', 'R' => '7', 'D' => 'A' },
      '7' => { 'U' => '3', 'L' => '6', 'R' => '8', 'D' => 'B' },
      '8' => { 'U' => '4', 'L' => '7', 'R' => '9', 'D' => 'C' },
      '9' => { 'L' => '8' },

      'A' => { 'R' => 'B', 'U' => '6' },
      'B' => { 'L' => 'A', 'U' => '7', 'D' => 'D', 'R' => 'C' },
      'C' => { 'L' => 'B', 'U' => '8' },

      'D' => { 'U' => 'B' }
    }.freeze

    def initialize(input_data, input_part_one = false)
      @input = input_data
      @version = input_part_one ? 1 : 2
    end

    def do_moves(starter, line)
      curpos = starter
      line.each_char do |direction|
        nextpos = (@version == 1 ? BUTTONS_V1 : BUTTONS_V2)[curpos][direction]

        curpos = nextpos if nextpos
      end
      curpos
    end

    def code
      @code ||= @input.split("\n").each_with_object([]) do |line, code|
        # puts "=> #{code[-1] || '?'} => #{line}"
        result = do_moves(code[-1] || '5', line)

        code << result
      end.join
    end
  end
end
