class Law
  attr_accessor :player

  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :type, type: String
  field :excerpt, type: String
  field :description, type: String
  field :state, type: String

  embeds_many :votes
  belongs_to :real_law
  has_many :proposals

  # embler sideloaded relationship
  def json_id
    _id.to_s
  end

  def scoped_with(player)
    @player = player
    self
  end

  def defined
    vote = player_vote
    return vote.defined if vote
    0
  end

  def favor
    vote = player_vote
    return vote.favor if vote
    -1
  end

  def votesFor
    votes.where({ favor: 1}).count
  end

  def votesAgainst
    votes.where({ favor: 0}).count
  end

  def update_vote(vote_attributes)
    return self unless player

    actual_vote = player_vote
    if actual_vote == nil
      actual_vote = Vote.new(vote_attributes.merge({player_id: player.id}))
      self.votes << actual_vote

      points = Point.points_for_vote_action(player)
      Event.create_vote_update_event(self.id, player.id, points)

      # verify if there is a "favor" mission
      #complete_mission_if_associated(player, "Law Favor")

    elsif actual_vote.defined == 0
      actual_vote.update(vote_attributes)
      if actual_vote.defined == 1
        points = Point.points_for_defining_vote(player)
        Event.create_vote_define_event(self.id, player.id, points)

        # verify if there is a "define" mission
        #complete_mission_if_associated(player, "Law Define")
      end
    else
      # Can't change a defined vote. But i will accept while debugging
      actual_vote.destroy if Rails.env.development?
    end
    self
  end

  def player_vote
    return self.votes.where({ player_id: player.id }).first if player
    nil
  end

  def complete_mission_if_associated(player, type)
    mission = player.missions.where(mission_type: type, reference_id: self.id).first
    unless mission.completed
      mission.complete_mission(player)
    end
    if type == "Law Favor"
      MissionGenerator.generate_define_law_mission(player, self)
    end
  end
end

