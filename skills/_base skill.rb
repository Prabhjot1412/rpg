class BaseSkill
  attr_reader :strength, :name, :targets, :cost
  def initialize(name: 'Base Skill', strength: 10, targets: 'single', cost: 0)
    @strength = strength
    @name     = name
    @targets  = targets # single or multiple
    @cost = cost
  end

  def cast(targets: [BaseCharacter.new], caster: BaseCharacter.new, battle_logs: [])
    # do something
  end

  private

  def skill_strength(caster: BaseCharacter.new)
    strength + caster.strength
  end

  def get_single_target(caster: BaseCharacter.new, targets: [BaseCharacter.new])
    if caster.player
      puts "pick your target"
      options = targets.map(&:name)
      input = GiveOptions.select_from_array(array: options)
      return if input == 'ESCAPE'
    else
     input = rand(targets.count)
    end
  end
end
