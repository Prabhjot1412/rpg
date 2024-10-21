class Attack < BaseSkill
  def initialize(name: 'Attack')
    super(name: name)
  end

  def cast(targets: [BaseCharacter.new], caster: BaseCharacter.new, battle_logs: [])
    system('clear')

    input = get_single_target(caster:, targets:)

    battle_logs << ["#{caster.name} used #{name} on #{targets.map(&:name).join(', ')}\n" \
                   "it dealt #{skill_strength(caster:)} points of damage \n"]

    targets[input].reduce_hp(amount: skill_strength(caster:))
  end
end
