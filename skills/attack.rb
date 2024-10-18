require_relative 'base skill'

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

# targets = [BaseCharacter.new]
# caster  = BaseCharacter.new
# Attack.new.cast(targets:, caster:)
# puts  targets[0].hp