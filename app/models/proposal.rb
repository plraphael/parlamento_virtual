class Proposal
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :player

  field :description, type: String
  belongs_to :law
  belongs_to :player
  has_many :votes_in_favor, class_name: 'Player'
  has_many :votes_against, class_name: 'Player'

  embeds_many :up_votes

  def self.in_order
    Proposal.all.sort do |x,y| 
      cmp = x.up_votes <=> y.up_votes 
      cmp = y.updated_at <=> x.updated_at if vots_cmp == 0
      cmp
    end
  end

  def scoped_with(player)
    @player = player
    self
  end

  def votes
    up_votes.inject(0){|s,v| s + v.favor}  
  end

  def favor
    vote = player_vote
    return vote.favor if vote
    0
  end

  def player_vote
    return self.up_votes.where({ player_id: player.id }).first if player
    nil
  end

  def json_id
    _id.to_s
  end

  def update_vote(vote_attributes)
    return self unless player

    actual_vote = player_vote
    if actual_vote == nil
      actual_vote = UpVote.new(vote_attributes.merge({player_id: player.id}))
      Point.points_for_updown_vote(player)
      self.up_votes << actual_vote
    else
      actual_vote.update(vote_attributes)
    end
    self
  end
end
