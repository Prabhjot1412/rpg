class Goblin < BaseCharacter
  def initialize(**args)
    super(**args)

    @name = args[:name] || 'Goblin'
    @hp = args[:hp] || 50
    @mp = args[:mp] || 50
    @skills['Fury Swipes'] = FurySwipes.new
  end
end
