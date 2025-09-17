class Tower
  attr_accessor :player
  def initialize(player: BaseCharacter.new)
    @player = player
    @config = TowerConfig.new
    @floor = 1
  end

  def start
    loop do
      puts "Current floor: #{@floor}".blue
      sleep @config.text_pause

      @floor.times do
        enemy = select_from_enemies_for_floor(floor: @floor)

        battle = Battle.new(player:, enemies: [enemy])
        battle_result = battle.start
        break if @player.is_dead?
      end

      break if @player.is_dead?

      @floor += 1
      @player.level_up
    end

    puts "you reached floor #{@floor}"
  rescue => e
    raise unless @config.debug_mode

    debugger
  end

  private

  def select_from_enemies_for_floor(floor: 1)
    if floor == 1
      [Goblin].sample.new(level: floor)
    else
      [Goblin].sample.new(level: floor)
    end
  end
end
