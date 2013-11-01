class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :kind, type: String
  field :player_id, type: Integer
  field :law_id, type: Integer
  field :points_earned, type: Integer
  field :player_level, type: Integer
  field :mission_id, type: Integer

  def self.create_vote_update_event(law_id, player_id, points)
    event = Event.new
    event.law_id = law_id
    event.player_id = player_id
    event.points_earned = points
    event.kind = "Vote Update"
    event.save
  end

  def self.create_vote_define_event(law_id, player_id, points)
    event = Event.new
    event.law_id = law_id
    event.player_id = player_id
    event.points_earned = points
    event.kind = "Define Vote"
    event.save
  end

  def self.create_level_up_event(player_id, player_level)
    event = Event.new
    event.player_id = player_id
    event.kind = "Level Up"
    event.player_level = player_level
    event.save
  end

  def self.create_mission_completed_event(player_id, mission_id)
    event = Event.new
    event.player_id = player_id
    event.kind = "Mission Completed"
    event.mission_id = mission_id
    event.save
  end

end
