class Year2016
  class Day22
    # rubocop:disable Lint/StructNewOverride
    Node = Struct.new(:x, :y, :size, :used, :avail, :percentage) do
      def pos
        @pos ||= [x, y]
      end

      def ==(other)
        self.class == other.class && @x == other.x && @y == other.y
      end
    end
    # rubocop:enable Lint/StructNewOverride

    def initialize(input_data)
      @nodes = input_data.lines.map do |line|
        next unless line =~ /^\/dev\/grid\/node-x(\d+)-y(\d+) +(\d+)T +(\d+)T +(\d+)T +(\d+)%$/

        # (:x, :y, :size, :used, :available, :percentage)
        Node.new(*[$1, $2, $3, $4, $5, $6].map(&:to_i))
      end
      @nodes = @nodes.compact.sort_by{|node| [node[0], node[1]] }
    end

    def max_x
      @max_x ||= @nodes.map(&:x).max
    end

    def max_y
      @max_y ||= @nodes.map(&:y).max
    end

    def to_i
      @nodes.combination(2).sum do |lhn, rhn|
        retval = 0
        retval += 1 unless lhn.used.zero? || lhn.used > rhn.avail
        retval += 1 unless rhn.used.zero? || rhn.used > lhn.avail
        retval
      end
    end

    def open_node
      @open_node ||= @nodes.find{|node| node.used.zero? }
    end

    def blocked_nodes
      @blocked_nodes ||= @nodes.select{|node| node.size > 100 }.map(&:pos).sort
    end

    EXPAND = [[0, 1], [0, -1], [1, 0], [-1, 0]].freeze

    # rubocop:disable Metrics/AbcSize,  Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
    def bfs(start, stop)
      seen = Set.new
      queue = [[start, 0]]
      until queue.empty?
        pos, steps = queue.shift
        next if seen.include?(pos)
        return steps if pos == stop

        seen.add(pos)
        EXPAND.each do |add_x, add_y|
          next_x = pos[0] + add_x
          next_y = pos[1] + add_y
          correct_x = next_x >= 0 && next_x <= max_x
          correct_y = next_y >= 0 && next_y <= max_y
          next unless correct_x && correct_y
          next if blocked_nodes.include?([next_x, next_y])

          queue.push([[next_x, next_y], steps + 1])
        end

      end
    end
    # rubocop:enable Metrics/AbcSize,  Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity

    def solve
      ans = bfs(open_node, [max_x - 1, 0])
      ans += 1
      ans += 5 * (max_x - 1)
      ans
    end
  end
end
