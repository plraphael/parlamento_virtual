class Player
  include Mongoid::Document
  field :name, type: String
  field :title, type: String
  field :points, type: Integer, default: 0
  field :admin, type: Mongoid::Boolean
  field :provider, type: String
  field :uid, type: Integer
  field :oauth_token, type: String
  field :oauth_token_expires_at, type: DateTime

  has_many :proposals

  embeds_many :missions

  def json_id
    self._id.to_s
  end

  def level
    Point.level_for(points)
  end

  def goal
    Point.points_for_next_level(self.level)
  end

  def baseline
    Point.points_for_next_level(self.level - 1)
  end

  def level_percentage
    p_for_level = Point.points_for_next_level(level)
    p_last_level =  Point.points_for_next_level(level - 1)

    player_points_on_this_level = self.points - p_last_level
    p_next = p_for_level - p_last_level

    return ((Float(player_points_on_this_level)/p_next).round(4))*100
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end


  def remaining_open_missions
    self.missions.where(completed: false).count
  end

  def photo
    "http://graph.facebook.com/#{uid}/picture?type=square"
  end
end
