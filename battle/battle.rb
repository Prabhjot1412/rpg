
class Battle
  def initialize(enemies: [BaseCharacter.new], player: BaseCharacter.new)
    @enemies = enemies
    @player = player
    @battle_logs = []
  end

  def start
    loop do
      system('clear')
      break if finish_battle

      @enemies.each do |enemy|
        DisplayOnScreen.box(values: {
          row1: [enemy.name, :center],
          row2: ["hp: #{enemy.hp.to_s.green}/#{enemy.max_hp.to_s.green}", "mp: #{enemy.mp.to_s.blue}/#{enemy.max_mp.to_s.blue}", "stamina: #{enemy.stamina.to_s.yellow}/#{enemy.max_stamina.to_s.yellow}"]
        })
      end

      2.times do
        puts ""
      end

      DisplayOnScreen.box(values: {
        row1: [@player.name, :center],
        row2: ["hp: #{@player.hp.to_s.green}/#{@player.max_hp.to_s.green}", "mp: #{@player.mp.to_s.blue}/#{@player.max_mp.to_s.blue}", "stamina: #{@player.stamina.to_s.yellow}/#{@player.max_stamina.to_s.yellow}"]
      })

      show_battle_logs

      options = [@player.skills.keys, 'Run Away'].flatten
      input = GiveOptions.select_from_array(array: options)
      break if options[input] == 'Run Away'
      next if input == 'ESCAPE'

      handle_atttack(options[input])

      return "dead" if handle_death == 'dead'
    end
  end

  private

  def handle_atttack(spell)
    ['mp', 'stamina'].each do |cost_type|
      if @player.skills[spell].cost_type == cost_type && @player.skills[spell].cost > @player.send(cost_type)
        @battle_logs << ["not enough #{cost_type}".blue]
        return
      end
    end

    @player.cast_spell(spell, targets: @enemies, battle_logs: @battle_logs)

    @enemies.each do |enemy|
      take_turn(enemy: enemy)
    end
  end

  def take_turn(enemy:)
    enemy_spell = enemy.skills.keys.select do |key|
      enemy.skills[key].cost <= enemy.mp
    end.sample

    enemy.cast_spell(enemy_spell, targets: [@player], battle_logs: @battle_logs)
  end

  def show_battle_logs
    logs = {}

    @battle_logs.last(6).each_with_index do |log, i|
      logs["row#{i}".to_sym] = log
    end

    DisplayOnScreen.box(values: logs)
  end

  def handle_death
    if @player.is_dead?
      puts "game over".red
      return 'dead'
    end

    @enemies.each do |enemy|
      if enemy.is_dead?
        @battle_logs.push("#{enemy.name} is died".blue)
        @enemies.delete(enemy)
      end
    end
  end

  def finish_battle
    @enemies.empty?
  end
end
