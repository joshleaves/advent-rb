class Year2015
  class Day13
    def interpret_happiness(line)
      line =~ /(\w+) would (\w+) (\d+) happiness units by sitting next to (\w+)./
      duet = [$1, $4].sort
      @happiness[duet] ||= 0
      @happiness[duet] += $3.to_i * ($2 == 'gain' ? +1 : -1)
    end

    def add_my_bored_happiness
      @characters.each do |character|
        duet = [character, 'ME'].sort
        @happiness[duet] = 0
      end
      @characters.push('ME')
    end

    def initialize(input_data, input_part_one = false)
      @input_file = input_data
      @happiness  = {}
      input_data.chomp.split("\n").each do |line|
        interpret_happiness(line)
      end
      @characters = @happiness.keys.flatten.uniq.sort
      add_my_bored_happiness unless input_part_one
    end

    def try_next_guest(starter_guest, current_guest, guests, current_happiness, current_best)
      return current_happiness + @happiness[[current_guest, starter_guest].sort] if guests.empty?

      best_happiness = current_best
      guests.each do |next_guest|
        next if next_guest == current_guest

        added = @happiness[[current_guest, next_guest].sort]
        guests_left = guests - [next_guest]
        new_best = try_next_guest(starter_guest, next_guest, guests_left, current_happiness + added, best_happiness)
        best_happiness = [best_happiness, new_best].compact.max
      end

      best_happiness
    end

    def to_i
      @to_i ||= begin
        very_happy = 0

        @characters.each do |starter_guest|
          new_happy = try_next_guest(starter_guest, starter_guest, @characters - [starter_guest], 0, 0)
          very_happy = [very_happy, new_happy].max
        end
        very_happy
      end
    end
  end
end
