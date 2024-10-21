class Goblin < BaseCharacter
  def initialize(**args)
    args[:name] ||= 'Goblin'
    args[:hp]   ||= 50
    args[:mp]   ||= 50

    super(**args)

    @skills['Fury Swipes'] = FurySwipes.new
  end
end
