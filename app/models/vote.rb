class Vote
  include Mongoid::Document
  field :player_id, type: String
  field :defined, type: Integer
  field :favor, type: Integer
  embedded_in :law
end
