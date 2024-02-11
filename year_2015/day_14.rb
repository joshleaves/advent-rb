class Year2015
  class Day14
    class Reindeer
      attr_reader :name, :curpos
      attr_accessor :points

      def initialize(input_line)
        input_line =~ /(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./
        @name = $1
        @speed = $2.to_i
        @length = $3.to_i
        @rest = $4.to_i
        @curpos = 0
        @state = 'RUNNING'
        @progress = 0
        @points = 0
      end

      def switch_state(new_state)
        @state = new_state
        @progress = 0
      end

      def advance(kms = 1)
        1.upto(kms) do
          @progress += 1
          if @state == 'RUNNING'
            @curpos += @speed
            switch_state('RESTING') if @progress == @length
          elsif @progress == @rest
            switch_state('RUNNING')
          end
        end
        curpos
      end
    end

    def initialize(input_data, input_part_one = false)
      @input_file = input_data
      @version = input_part_one ? 1 : 2
      @reindeers = input_data.chomp.split("\n").map do |input_line|
        Reindeer.new(input_line)
      end
    end

    def simple_to_i(kms = 1)
      @reindeers.map{|reindeer| reindeer.advance(kms) }.max
    end

    def to_i(kms = 1)
      return simple_to_i(kms) if @version == 1

      0.upto(kms) do
        lead = @reindeers.map(&:advance).max
        @reindeers.select{|reindeer| reindeer.curpos == lead }.each do |reindeer|
          reindeer.points += 1
        end
      end
      @reindeers.map(&:points).max
    end
  end
end
