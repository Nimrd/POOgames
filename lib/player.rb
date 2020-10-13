require 'pry'

class Player
    attr_accessor :name, :life_points #on définit une variable d'instance lisible et modifiable

    def initialize(name_player)
        @name = name_player
           @life_points = 10
        
    end 

    def show_state
        puts "#{name} a #{life_points} points de vie"
 
    end

    def gets_damage(damage)
         @life_points = @life_points - damage 
         if life_points <= 0
          puts "Le joueur #{name} à été tué !"
         end
    end 

    def attacks(name_player)
        puts"le joueur #{name} attaque le joueur #{name_player.name}"
        damage = compute_damage
        puts "#{name} inflige #{damage} points de dommages à #{name_player.name}"
        name_player.gets_damage(damage)
    end

    def compute_damage
        return rand(1..6)
        
    end

end

class HumanPlayer < Player
    attr_accessor :weapon_level
  
    def initialize(name)
      @name = name
      @life_points = 100
      @weapon_level = 1
    end
  
    def show_state
      puts "#{@name} a #{@life_points} point de vie et une arme de niveau#{@weapon_level}."
    end
  
    def compute_damage
      return rand(1..6) * @weapon_level
    end
  
    def search_weapon
      weapon_found = rand(1..6)
      puts "Tu as trouvé une arme de niveau #{weapon_found}"
      if weapon_found > @weapon_level
        @weapon_level = weapon_found
        puts "Youhou! elle est meilleure que ton arme actuelle : tu la prends."
      else
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      end
    end
  
    def search_health_pack
      health_pack_found = rand(1..6)
      puts health_pack_found
      if health_pack_found == 1
        puts "Tu n'as rien trouvé... "
      elsif health_pack_found > 1 && health_pack_found < 6
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        if @life_points <= 50
          @life_points = @life_points + 50
        else
          @life_points = @life_points + 50 - (@life_points - 50)
        end
      else
        puts "Waow, tu as trouvé un pack de +80 points de vie !"
          @life_points = @life_points + 80
          if @life_points > 100
            @life_points = @life_points + (100 - @life_points)
          end
      end
    end

binding.pry
