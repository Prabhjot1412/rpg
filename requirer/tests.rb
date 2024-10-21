require_relative 'index'

# characters
puts BaseCharacter.new
goblin = Goblin.new(hp: 180)
raise if goblin.hp != 180

# battle
player = BaseCharacter.new(name: 'myname', player: true, hp: 200, skills: {'Attack' => Attack.new, 'Fury Swipes' => FurySwipes.new})
battle = Battle.new(player:, enemies: [Goblin.new(hp: 2000)])
# battle.start

# giveOptions
# puts GiveOptions.select_from_array(array: ['option1', 'option2', 'option3'])

# skills
targets = [BaseCharacter.new(hp: 100)]
caster  = BaseCharacter.new(strength: 0)
Attack.new.cast(targets:, caster:, battle_logs: [])
raise unless  targets[0].hp == 90

# displayOnScreen
DisplayOnScreen.box(values: {row1: ["name", :center], row2: ["hp: 100", "mp: 100", "stamina: 50"], row3: []})

# playerCreation
# PlayerCreation.create
# player = PlayerCreation.singleton_player
# puts player.name

# tower
tower = Tower.new
tower.start

puts "SUCCESS".green