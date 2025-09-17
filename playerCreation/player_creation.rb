class PlayerCreation
  class << self

    def create
      @@player ||= nil
      raise "player already exists" if @@player

      puts ""
      print "Enter a name >>>"
      name = gets.chomp

      puts ""
      puts "Select your job"
      options = ['Warrior', 'Mage']
      input = GiveOptions.select_from_array(array: options)
      job = options[input]
      case job
      when 'Warrior'
        job = Warrior.new
      when 'Mage'
        job = Mage.new
      end

      @@player = Hero.new(name:, player: true, job:)
    end

    def singleton_player
      @@player ||= nil
      raise "no player available, run create method to create a player" unless @@player

      @@player
    end
  end
end
