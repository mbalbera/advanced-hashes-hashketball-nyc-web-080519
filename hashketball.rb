# Write your code here!

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
  return hash 
end

def num_points_scored(player_name)
  game_hash.each do |home_away, keys|
    keys.each do |att, data|
      next unless att == :players
      
      data.each do |player|
      return player[:points]if player[:player_name] == player_name
     end 
    end 
  end
end




def shoe_size(name)
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == name
        return player_hash[:shoe_size]
      end
    end
  end
end

def team_colors(team_name)
  hash = game_hash
  array = []
  hash.each do |l, att|
    if hash[l].values.include?(team_name)
      att.each do |a, i|
        if a == :colors
          return i
        end
      end
    end
  end
end

def team_names
  hash = game_hash
  array = []
  hash.each do |l, att|
    att.each do |a, i|
      if a == :team_name
        array << i
      end
    end 
  end
  return array
end

def player_numbers(team_name)
  hash = game_hash
  array = []
  hash.each do |l, att|
    if hash[l].values.include?(team_name)
      att.each do |a, i|
        if i.class == Hash
          i.each do |p, stats|
            stats.each do |s, int|
              if s == :number
                array << int.to_i
              end
            end
          end
        end
      end
    end
  end
  return array
end

def player_stats(name, game)
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == name
        return player_hash[:stats]
      end
    end
  end
end

def big_shoe_rebounds
  hash = game_hash
  player_name = ""
  shoe_size = 0
  hash.each do |l, att|
    att.each do |a, i|
      if i.class == Hash
        i.each do |player, stats|
            stats.each do |stat, int|
              if stat == :shoe
                if int > shoe_size
                  shoe_size = int
                  player_name = player
                end
              end
            end
          end
        return hash[l][att][player_name][:rebounds]
      end
    end
  end
end







