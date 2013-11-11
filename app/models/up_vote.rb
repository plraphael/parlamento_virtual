class UpVote
  include Mongoid::Document
  field :player_id, type: String
  field :favor, type: Integer
  embedded_in :proposal
end