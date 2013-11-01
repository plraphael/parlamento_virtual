class Mission
  include Mongoid::Document
  field :mission_type, type: String
  field :completed, type: Boolean, default: false
  field :text, type: String
  field :url, type: String
  field :reference_id, type: String, default: ""

  embedded_in :player

  def complete_mission(player)
    self.completed = true
    Point.points_for_mission(player, self.mission_type)
    # log the event
    Event.create_mission_completed_event(player.id, self.id)
    self.save
  end

  def json_id
    self._id.to_s
  end

end
