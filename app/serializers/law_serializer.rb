#falta o scope aqui
class LawSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :title, :excerpt, :description, :state, :votesFor, :votesAgainst, :favor, :defined, :updated
  has_many :proposals, embed_key: :json_id

  def id
    object._id.to_s
  end

  def updated
    0
  end

end
