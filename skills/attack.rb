class Attack < BaseSkill
  def initialize(name: 'Attack')
    super(name: name)
  end

  def cast(targets: [BaseCharacter.new], caster: BaseCharacter.new, battle_logs: [])
    validate_single_target_skill

    battle_logs << ["#{caster.name} used #{name} on #{targets.map(&:name).join(', ')}\n" \
                   "it dealt #{strength} points of damage \n"]

    targets.each do |target|
      target.reduce_hp(amount: strength)
    end
  end
end
