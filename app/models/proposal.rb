class Proposal
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type: String
  belongs_to :law
  belongs_to :player
  has_many :votes_in_favor, class_name: 'Player'
  has_many :votes_against, class_name: 'Player'

  def json_id
    _id.to_s
  end
end
