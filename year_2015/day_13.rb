class Year2015
  class Day13
    def initialize(input_data, input_part_one = false)
      @happiness = Hash.new{ 0 }
      input_data.chomp.split("\n").each do |line|
        interpret_happiness(line)
      end
      @characters = @happiness.keys.flatten.uniq.sort
      add_my_bored_happiness unless input_part_one
    end

    def interpret_happiness(line)
      line =~ /(\w+) would (\w+) (\d+) happiness units by sitting next to (\w+)./
      duet = [$1, $4]
      gain = $3.to_i * ($2 == 'gain' ? +1 : -1)
      @happiness[duet] += gain
      @happiness[duet.reverse] += gain
    end

    def add_my_bored_happiness
      @characters.each do |character|
        @happiness[[character, 'ME']] = 0
        @happiness[['ME', character]] = 0
      end
      @characters.push('ME')
    end

    def calculate_happiness_for(combination)
      very_happy = @happiness[[combination.first, combination.last]]
      combination.each_cons(2) do |duet|
        very_happy += @happiness[duet]
      end
      very_happy
    end

    def to_i
      @characters[1..].permutation(@characters.length - 1).map do |combination|
        calculate_happiness_for([@characters[0]] + combination)
      end.max
    end
  end
end
