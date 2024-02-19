class Year2015
  class Day22
    def initialize(input_boss, input_part_one = false)
      @version = input_part_one ? 1 : 2
      @boss = input_boss
      @least_mana = 100**100
    end

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/ParameterLists, Style/NegatedIf
    def combat(user_hp, user_mp, boss_hp, effects, player_turn, cost = 0)
      # We are pruning because it's worse or because we are dead
      return if cost >= @least_mana || user_mp.negative?

      user_hp -= 1 if @version == 2 && player_turn
      return if user_hp <= 0

      user_df = effects[0].positive? ? 7 : 0
      boss_hp -= 3 if effects[1].positive?
      user_mp += 101 if effects[2].positive?
      effects.map!{|effect| [0, effect - 1].max }
      # If we have a situation where the boss is dead we take it.
      return @least_mana = [@least_mana, cost].min if boss_hp <= 0

      # This is a boss turn, since we want to early exit
      if !player_turn
        user_hp -= [1, @boss[:damage] - user_df].max
        combat(user_hp, user_mp, boss_hp, effects, true, cost) if user_hp.positive?
        return
      end

      # Magic Missile
      combat(user_hp, user_mp - 53, boss_hp - 4, effects.dup, false, cost + 53)

      # Drain
      combat(user_hp + 2, user_mp - 73, boss_hp - 2, effects.dup, false, cost + 73)

      # Shield
      combat(user_hp, user_mp - 113, boss_hp, [6, effects[1], effects[2]], false, cost + 113) if effects[0].zero?

      # Poison
      combat(user_hp, user_mp - 173, boss_hp, [effects[0], 6, effects[2]], false, cost + 173) if effects[1].zero?

      # Recharge
      combat(user_hp, user_mp - 229, boss_hp, [effects[0], effects[1], 5], false, cost + 229) if effects[2].zero?
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/ParameterLists, Style/NegatedIf

    def to_i
      combat(50, 500, @boss[:hp], [0, 0, 0], true)
      @least_mana
    end
  end
end
