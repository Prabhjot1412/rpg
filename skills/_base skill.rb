class BaseSkill
  attr_reader :strength, :name, :targets
  def initialize(name: 'Base Skill', strength: 10, targets: 'single')
    @strength = strength
    @name     = name
    @targets  = targets
  end

  def cast(targets: [BaseCharacter.new], caster: BaseCharacter.new)
    # do something
  end

  private

  def validate_single_target_skill
    raise 'must pass a single target' if targets != 'single'
  end
end
