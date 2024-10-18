require_relative 'index'

# characters
puts BaseCharacter.new

# battle
battle = Battle.new
# battle.start

# displayOptions
# puts GiveOptions.select_from_array(array: ['option1', 'option2', 'option3'])

# skills
targets = [BaseCharacter.new]
caster  = BaseCharacter.new
Attack.new.cast(targets:, caster:)
puts  targets[0].hp