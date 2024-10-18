require_relative '../characters/index'
require_relative '../displayOnScreen/display_on_screen'
require_relative '../giveOptions/give_options'
require 'colorize'

class Battle
  def initialize(enemies: [BaseCharacter.new], player: BaseCharacter.new)
    @enemies = enemies
    @player = player
  end

  def start
    loop do
      system('clear')
      @enemies.each do |enemy|
        DisplayOnScreen.box(values: {
          row1: [enemy.name, :center],
          row2: ["hp: #{enemy.hp.to_s.green}", "mp: #{enemy.mp.to_s.blue}", "stamina: #{enemy.stamina.to_s.yellow}"]
        })
      end

      3.times do
        puts ""
      end

      DisplayOnScreen.box(values: {
        row1: [@player.name, :center],
        row2: ["hp: #{@player.hp.to_s.green}", "mp: #{@player.mp.to_s.blue}", "stamina: #{@player.stamina.to_s.yellow}"]
      })

      options = ['Attack', 'Run Away']
      input = GiveOptions.select_from_array(array: options)
      break if options[input] == 'Run Away'
      next if input == 'ESCAPE'

      
      handle_atttack if options[input] == 'Attack'
    end
  end

  private

  def handle_atttack
    system('clear')
    puts "pick your target"
    options = @enemies.map(&:name)
    input = GiveOptions.select_from_array(array: options)
    return if input == 'ESCAPE'

    # anchor perform attack on @enemies[input]
  end
end

battle = Battle.new
battle.start