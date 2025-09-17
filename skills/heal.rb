class Heal < BaseSkill
  def initialize(name: 'Heal')
    super(name: name, strength: 50, cost: 40)
  end

  def cast(targets: [BaseCharacter.new], caster: BaseCharacter.new, battle_logs: [])
    targets = [targets, caster].flatten
    log = "#{caster.name} used #{name} on #{targets.map(&:name).join(', ')}\n"
    input = get_single_target(caster:, targets:)

    amount = targets[input].heal_hp(amount: skill_strength(caster:))

    log += "it healed #{amount} points of damage \n"

    battle_logs << [log]
    caster.mp -= cost
  end
end
