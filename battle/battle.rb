
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
          row2: ["hp: #{enemy.hp.to_s.green}", "mp: #{enemy.mp.to_s.blue}", "stamina: #{enemy.stamina.to_s.yellow}"]
        })
      end

      2.times do
        puts ""
      end

      DisplayOnScreen.box(values: {
        row1: [@player.name, :center],
        row2: ["hp: #{@player.hp.to_s.green}", "mp: #{@player.mp.to_s.blue}", "stamina: #{@player.stamina.to_s.yellow}"]
      })

      show_battle_logs

      options = ['Attack', 'Run Away']
      input = GiveOptions.select_from_array(array: options)
      break if options[input] == 'Run Away'
      next if input == 'ESCAPE'

      
      handle_atttack if options[input] == 'Attack'

      handle_death
    end
  end

  private

  def handle_atttack
    system('clear')
    puts "pick your target"
    options = @enemies.map(&:name)
    input = GiveOptions.select_from_array(array: options)
    return if input == 'ESCAPE'

    @player.cast_spell('Attack', targets: [@enemies[input]], battle_logs: @battle_logs)

    @enemies.each do |enemy|
      take_turn(enemy: enemy)
    end
  end

  def take_turn(enemy:)
    # to-do enhance this when more skills are added

    enemy_spell = enemy.skills.keys.sample
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
      exit
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
