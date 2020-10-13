require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"

puts "Quel est ton pseudo? :)"
print "> "
user_name = gets.chomp
user = HumanPlayer.new(user_name)
player1 = Player.new("José")
player2 = Player.new("Josiane")

enemies = []
enemies << player1 << player2
puts "Voici #{user_name}!"
puts ""
puts "Attention, 2 enemies en vue, José and Josiane. Combattez!"
puts ""

 while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0) do

  puts "Nimrod n'est pas relou, n'est ce pas Linda"
  user.show_state
  puts ""

  puts "Quelle action veux-tu effectuer?"
  puts ""

  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts ""

  puts "attaquer un joueur en vue :"
  puts "0 - #{player1.name} a #{player1.life_points} points de vie."
  puts "1 - #{player2.name} a #{player2.life_points} points de vie ."
  puts ""

  puts "Entrez votre choix:"
  print "> "
  user_input = gets.chomp

  if user_input == "a"
    user.search_weapon
  elsif user_input == "s"
    user.search_health_pack
  elsif user_input == "0"
    user.attacks(player1)
  elsif user_input == "1"
    user.attacks(player2)
  end

  puts "Les autres joueurs t'attaquent !"

  enemies.each do |player|
    if player.life_points > 0
      player.attacks(user)
    end
  end

end

puts "|La partie est finie.|"

  if player1.life_points <= 0 && player2.life_points <= 0
    puts "|BRAVO ! TU AS GAGNE !!!!!    |"
  elsif user.life_points <= 0
    puts "Loser ! Tu as perdu !"
  end

binding.pry