class BaseCharacter
  attr_accessor :hp, :mp, :stamina, :name, :strength, :level, :skills
  def initialize(name: 'no name', hp: 100, mp: 100, stamina: 50, strength: 10, level: 1, skills: [Attack.new])
    @name     = name
    @hp       = hp
    @mp       = mp
    @stamina  = stamina
    @strength = strength
    @level    = level
    @skills   = skills
  end

  def reduce_hp(amount: 10)
    @hp -= amount
  end
end

puts BaseCharacter.new