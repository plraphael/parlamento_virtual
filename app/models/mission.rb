class Mission
  include Mongoid::Document
  include Mongoid::Timestamps

  field :mission_type, type: String
  field :completed, type: Boolean, default: false
  field :text, type: String
  field :url, type: String
  field :reference_id, type: String, default: ""

  belongs_to :player

  def complete_mission(player)
    if self.completed == false
      self.completed = true
      if mission_type == "check_in"
        Point.points_for_mission(player)
      end
      Event.create_mission_completed_event(player.id, self.id)
      self.save
      MissionGenerator.generate_more_missions(player,self)
    end
  end

  def json_id
    self._id.to_s
  end
end
