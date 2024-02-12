class Year2015
  class Day16
    MFCSAM_RESULTS = <<~HEREDOC.freeze
      children: 3
      cats: 7
      samoyeds: 2
      pomeranians: 3
      akitas: 0
      vizslas: 0
      goldfish: 5
      trees: 3
      cars: 2
      perfumes: 1
    HEREDOC

    def initialize(input_data, input_part_one = false)
      @input_file = input_data
      @version = input_part_one ? 1 : 2
      @aunts = input_data.chomp.split("\n").each_with_index.map do |input_line, i|
        { 'idx' => i + 1 }.merge(input_line.scan(/(\w+): (\d+)/).to_h{|k, v| [k, v.to_i] })
      end
    end

    def mfcsam_properties
      MFCSAM_RESULTS.chomp.split("\n").to_h do |line|
        line.scan(/(\w+): (\d+)/)
        [$1, $2.to_i]
      end
    end

    def check_aunt(aunt, property, value)
      return true unless aunt.key?(property)

      case property
      when 'cats', 'trees'
        aunt[property] > value
      when 'pomeranians', 'goldfish'
        aunt[property] < value
      else
        aunt[property] == value
      end
    end

    def to_i
      mfcsam_properties.each do |property, value|
        @aunts.select! do |aunt|
          next check_aunt(aunt, property, value) if @version == 2
          next true unless aunt.key?(property)

          aunt[property] == value
        end
      end
      @aunts[0]['idx']
    end
  end
end
