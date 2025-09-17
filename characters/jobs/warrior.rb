class Warrior < BaseJob
  def stats
    {
      max_hp: 15,
      max_mp: 5,
      max_stamina: 10,
      level: 1
    }
  end

  def initial_skills
    {
      'Heavy Strike' => HeavyStrike.new
    }
  end
end