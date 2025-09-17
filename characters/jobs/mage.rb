class Mage < BaseJob
  def stats
    {
      max_hp: 5,
      max_mp: 20,
      max_stamina: 5,
      level: 1
    }
  end

  def initial_skills
    {
      'Magic Strike' => MagicStrike.new
    }
  end
end
