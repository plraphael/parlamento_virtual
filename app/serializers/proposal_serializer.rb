class ProposalSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :description, :author_name, :author_image

  # https://github.com/rails-api/active_model_serializers#associations
  has_one :law, embed_key: :json_id
  has_one :player, embed_key: :json_id

  def id
    object._id.to_s
  end

  def votesInFavor
    object.votesInFavor.size
  end

  def votesAgainst
    object.votesAgainst.size
  end

  def author_name
    player.name
  end

  def author_image
    player.photo
  end

  # TODO (consider author vote)
  def favor
    1
  end
end
