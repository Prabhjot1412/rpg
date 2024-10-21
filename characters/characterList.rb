module CharacterList
  extend self

  def enemies
    all_characters[:enemies]
  end

  def all_characters
    {
      enemies: [
        Goblin,
      ]
    }
  end
end