class MissionSerializer < ActiveModel::Serializer
  attributes :id, :mission_type, :completed, :text, :url
  embed :id
  has_one :player, embed_key: :json_id

  def id
    object._id.to_s
  end
end