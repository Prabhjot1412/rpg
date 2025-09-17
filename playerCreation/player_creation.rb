class PlayerCreation
  class << self

    def create
      @@player ||= nil
      raise "player already exists" if @@player

      puts ""
      print "Enter a name >>>"
      name = gets.chomp

      @@player = Hero.new(name:, player: true)
    end

    def singleton_player
      @@player ||= nil
      raise "no player available, run create method to create a player" unless @@player

      @@player
    end
  end
end