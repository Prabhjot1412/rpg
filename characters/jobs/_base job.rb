class BaseJob
  def level_up(character: BaseCharacter.new)
    stats.keys.each do |stat|
      character.instance_variable_set("@#{stat}", character.instance_variable_get("@#{stat}") + stats[stat])
    end
  end

  def stats
    {
      max_hp: 10,
      max_mp: 10,
      max_stamina: 10,
      level: 1
    }
  end
end
