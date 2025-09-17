class FurySwipes < BaseSkill
  def initialize(name: 'Fury Swipes')
    super(name: name, strength: 1, cost: 45, cost_type: 'stamina')
  end

  def cast(targets: [BaseCharacter.new], caster: BaseCharacter.new, battle_logs: [])
    log = "#{caster.name} used #{name} on #{targets.map(&:name).join(', ')}\n"

    input = get_single_target(caster:, targets:)

    3.times do
      log += "it dealt #{skill_strength(caster:)} points of damage \n"

      targets[input].reduce_hp(amount: skill_strength(caster:))
    end

    battle_logs << [log]
    caster.stamina -= cost
  end
end
