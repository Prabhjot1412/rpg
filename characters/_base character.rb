class BaseCharacter
  attr_accessor :hp, :mp, :stamina, :name, :strength, :level, :skills, :player
  def initialize(name: 'no name', hp: 100, mp: 100, stamina: 50, strength: 10, level: 1, skills: {'Attack' => Attack.new}, player: false)
    @name     = name
    @hp       = hp
    @mp       = mp
    @stamina  = stamina
    @strength = strength
    @level    = level
    @skills   = skills
    @player = false
  end

  def reduce_hp(amount: 10)
    @hp -= amount
  end

  def cast_spell(spell_name, targets: [BaseCharacter.new], battle_logs: [])
    skills[spell_name].cast(targets:, battle_logs:, caster: self)
  end

  def is_dead?
    @hp <= 0
  end
end
