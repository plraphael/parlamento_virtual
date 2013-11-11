class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :points, :level, :admin, :level_percentage, :goal, :baseline, :photo
  def id
    object._id.to_s
  end

  has_many :missions
end
