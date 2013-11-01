class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :type, :action
end
