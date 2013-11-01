class Message
  include Mongoid::Document
  field :content, type: String
  field :type, type: String
  field :action, type: String
end
