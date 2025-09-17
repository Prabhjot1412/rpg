class Heal < BaseSkill
  def initialize(name: 'Heal')
    super(name: name, strength: 50, cost: 40, cost_type: 'mp')
  end

  def cast(targets: [BaseCharacter.new], caster: BaseCharacter.new, battle_logs: [])
    targets = [caster, targets].flatten
    log = "#{caster.name} used #{name} on self\n"
    input = caster

    amount = caster.heal_hp(amount: skill_strength(caster:))

    log += "it healed #{amount} points of damage \n"

    battle_logs << [log]
    caster.mp -= cost
  end
end
