class Year2015
  class Day21
    WEAPONS = [
      ['Dagger',     8,  4, 0],
      ['Shortsword', 10, 5, 0],
      ['Warhammer',  25, 6, 0],
      ['Longsword',  40, 7, 0],
      ['Greataxe',   74, 8, 0]
    ].freeze
    ARMORS = [
      ['None',        0,   0, 0],
      ['Leather',     13,  0, 1],
      ['Chainmail',   31,  0, 2],
      ['Splintmail',  53,  0, 3],
      ['Bandedmail',  75,  0, 4],
      ['Platemail',   102, 0, 5]
    ].freeze
    ACCESSORIES = [
      ['None',       0,   0, 0],
      ['None',       0,   0, 0],
      ['Damage +1',  25,  1, 0],
      ['Damage +2',  50,  2, 0],
      ['Damage +3',  100, 3, 0],
      ['Defense +1', 20,  0, 1],
      ['Defense +2', 40,  0, 2],
      ['Defense +3', 80,  0, 3]
    ].freeze

    def initialize(input_boss, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @boss = input_boss
      @best_price = @version == 1 ? 256 : 8
    end

    def simulate_battle(player_damage, player_armor)
      player_hp = 100
      player_damage = [1, player_damage - @boss[:armor]].max
      boss_hp = @boss[:hp]
      boss_damage = [1, @boss[:damage] - player_armor].max

      player_turns = (player_hp / boss_damage) + 1
      boss_turns = (boss_hp / player_damage) + 1
      player_turns >= boss_turns

      # until boss_hp.negative? || player_hp.negative?
      #   boss_hp -= player_attack
      #   # puts "-> Player deals #{player_attack} damage; the boss goes down to #{boss_hp}"
      #   return true if boss_hp.negative?

      #   player_hp -= boss_attack
      #   # puts "-> Boss deals #{boss_attack} damage; the player goes down to #{player_hp}"
      #   return false if player_hp.negative?
      # end
    end

    def use_equipment(equipment)
      price = equipment.sum{|object| object[1] }

      damage = equipment.sum{|object| object[2] }
      armor =  equipment.sum{|object| object[3] }
      result = simulate_battle(damage, armor)
      update_price(price, result)
    end

    def loop_equiment
      WEAPONS.each do |weapon|
        ARMORS.each do |armor|
          ACCESSORIES[0..-2].each_with_index do |acc1, i|
            ACCESSORIES[i..].each do |acc2|
              use_equipment([weapon, armor, acc1, acc2])
            end
          end
        end
      end
    end

    def update_price(price, result)
      if @version == 1 && result
        @best_price = [@best_price, price].min
      elsif @version == 2 && !result
        @best_price = [@best_price, price].max
      end
    end

    def to_i
      loop_equiment
      @best_price
    end
  end
end
