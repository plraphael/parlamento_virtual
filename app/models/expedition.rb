class Expedition
  include Mongoid::Document
  field :date, type: String
  field :description, type: String
  embedded_in :real_law
end
