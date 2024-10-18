require 'colorize'
require 'debug'

Dir["#{Dir.pwd}/battle/*.rb"].each {|file| require file }
Dir["#{Dir.pwd}/characters/*.rb"].each {|file| require file }
Dir["#{Dir.pwd}/displayOnScreen/*.rb"].each {|file| require file }
Dir["#{Dir.pwd}/giveOptions/*.rb"].each {|file| require file }
Dir["#{Dir.pwd}/skills/*.rb"].each {|file| require file }

