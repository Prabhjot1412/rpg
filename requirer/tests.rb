require_relative 'index'

# characters
puts BaseCharacter.new

# battle
# battle = Battle.new(player: BaseCharacter.new(hp: 200))
# battle.start

# giveOptions
# puts GiveOptions.select_from_array(array: ['option1', 'option2', 'option3'])

# skills
targets = [BaseCharacter.new(hp: 100)]
caster  = BaseCharacter.new(strength: 10)
Attack.new.cast(targets:, caster:, battle_logs: [])
raise unless  targets[0].hp == 90

# displayOnScreen
DisplayOnScreen.box(values: {row1: ["name", :center], row2: ["hp: 100", "mp: 100", "stamina: 50"], row3: []})
