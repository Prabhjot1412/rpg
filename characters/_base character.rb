class BaseCharacter
  attr_accessor :hp, :mp, :stamina, :name, :strength, :level, :skills, :player, :job
  def initialize(name: 'no name', hp: 100, mp: 100, stamina: 50, strength: 10, level: 1,
    skills: {'Attack' => Attack.new}, player: false, job: Warrior.new)

    @name     = name
    @hp       = hp
    @mp       = mp
    @stamina  = stamina
    @strength = strength
    @skills   = skills
    @player   = false
    @job      = job

    @level = 1
    set_level(level:) if level > 1
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

  def set_level(level: 2)
    (level -1).times do
      level_up
    end
  end

  def level_up
    @job.level_up(character: self)
  end
end
