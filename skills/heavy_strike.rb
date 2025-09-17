class HeavyStrike < BaseSkill
  def initialize(name: 'Heavy Strike')
    super(name: name, strength: 20, cost: 40, cost_type: 'stamina')
  end

  def cast(targets: [BaseCharacter.new], caster: BaseCharacter.new, battle_logs: [])
    log = "#{caster.name} used #{name} on #{targets.map(&:name).join(', ')}\n"
    input = get_single_target(caster:, targets:)

    log += "it dealt #{skill_strength(caster:)} points of damage \n"

    targets[input].reduce_hp(amount: skill_strength(caster:))

    battle_logs << [log]
    caster.stamina -= cost
  end
end
