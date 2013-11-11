# TODO falta o scope aqui
class LawSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :title, :excerpt, :description, :state, :votesFor, :votesAgainst, :favor, :defined, :updated, :authors
  has_many :proposals, embed_key: :json_id

  def id
    object._id.to_s
  end 

  def updated
    0
  end

  def authors
    authors_arr = []
    object.real_law.real_authors.each do |author|
      authors_arr << "#{author.name} (#{author.party})"
    end
    authors_arr.join(', ')
  end
end
