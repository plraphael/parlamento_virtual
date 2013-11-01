class Point

  @@new_vote_points = 5
  @@define_vote_points = 15
  @@checkin_points = 10
  @@mission_law_favor_points = 5
  @@mission_law_define_points = 10

  @@levels = [
    0,
    100,
    300,
    600,
    1000,
    1500,
    2100,
    2800,
    3600,
    4500,
    5500,
    6600,
    7800,
    9100,
    10500,
    12000,
    13600,
    15300,
    17100,
    19000,
    10000000
  ]

  def self.points_for_next_level(level)
    @@levels[level]
  end

  #delete this?
  def bla
    @@level[level - 1]
  end

  def self.level_for(points)
    @@levels.each_with_index do |v, i|
      if v > points
        return i
      end
    end
  end

  def self.points_for_vote_action(player)
    add_player_points(player, @@new_vote_points)
    @@new_vote_points
  end

  def self.points_for_defining_vote(player)
    add_player_points(player, @@define_vote_points)
    @@define_vote_points
  end


  def self.points_wathever(player,points)
    add_player_points(player, points)
    points
  end

  def self.points_for_mission(player, mission_type)
    points = 0
    if mission_type == "Check In"
      points = add_player_points(player, @@checkin_points)
    #elsif mission_type == "Law Favor"
    #  points = add_player_points(player, @@mission_law_favor_points)
    #elsif mission_type == "Law Define"
    #  points = add_player_points(player, @@mission_law_define_points)
    end
    points
  end

  def self.add_player_points(player, points)
    # recupera pontos do usuario e adiciona os pontos novos
    old_level = player.level
    player.points += points
    new_level = player.level

    # verifica se passou de level
    if new_level >= old_level
      Event.create_level_up_event(player.id, player.level)
    end

    player.save
    event = "messages.player.#{player.id}"
    $redis.publish(event,{message: {message: PlayerSerializer.new(player) , event: event}}.to_json)
    # avisar o redis dos pontos? (provavelmente da publish em algum channel/pattern)
    # avisar o redis do level? (provavelmente da publish em algum channel/pattern)
  end
end
