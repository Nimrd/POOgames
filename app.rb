require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
puts "A ma droite nous avons #{player1.name}"
player2 = Player.new("José")
puts "A ma gauche nous avons #{player2.name}"
puts "---------------"
puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state 
puts "---------------"
puts "Passons à la phase d'attaque :"
while player1.life_points > 0 && player2.life_points > 0
  player1.attacks(player2)
if player2.life_points <= 0
  break 
end
player2.attacks(player1)
puts "------------"
puts "Voici l'etat de chaque joueur"
puts "#{player1.name} a #{player1.life_points} points de vie"
puts "#{player2.name} a #{player2.life_points} points de vie"
puts "------------"
end 
