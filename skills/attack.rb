class Attack < BaseSkill
  def initialize(name: 'Attack')
    super(name: name)
  end

  def cast(targets: [BaseCharacter.new], caster: BaseCharacter.new)
    validate_single_target_skill

    targets.each do |target|
      target.reduce_hp(amount: strength)
    end
  end
end
