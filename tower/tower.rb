class Tower
  attr_accessor :player
  def initialize(player: BaseCharacter.new)
    @player = player
    @config = TowerConfig.new
    @floor = 1
  end

  def start
    loop do
      puts "#{@floor}"
      enemy = CharacterList.enemies.sample.new
      battle = Battle.new(player:, enemies: [enemy])
      battle_result = battle.start
      break if battle_result == 'dead'
    end

    puts "you reached floor #{@floor}"
  rescue => e
    raise unless @config.debug_mode

    debugger
  end
end
