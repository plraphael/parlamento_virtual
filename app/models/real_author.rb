class RealAuthor
  include Mongoid::Document
  field :name, type: String
  field :party, type: String # partido
  field :state, type: String # UF
  embedded_in :real_law
end
