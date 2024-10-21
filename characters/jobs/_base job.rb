class BaseJob
  def level_up(character: BaseCharacter.new)
    stats.keys.each do |stat|
      character.instance_variable_set("@#{stat}", character.instance_variable_get("@#{stat}") + stats[stat])
    end
  end

  def stats
    {
      hp: 10,
      mp: 10,
      level: 1
    }
  end
end
