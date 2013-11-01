class MissionGenerator


  def self.generate_first_missions(player)
    # generate check in mission
    generate_check_in_mission(player)

    # generate favor and defined law missions
    laws = Law.all.take(2)
    laws.each do |law|
      generate_favor_law_mission(player, law)
    end
  end

  def self.generate_check_in_mission(player)
    check_in_mission = Mission.new
    check_in_mission.mission_type = "Check In"
    check_in_mission.text = "Marque sua presença"
    check_in_mission.url = "/check_in"
    player.missions << check_in_mission
    check_in_mission.save
  end

  def self.generate_favor_law_mission(player, law)
    m_favor = Mission.new
    m_favor.mission_type = "Law Favor"
    m_favor.text = "Posicione-se na #{law.title}" 
    m_favor.reference_id = law.id
    m_favor.url = "/\#/law/#{law.id}"
    player.missions << m_favor
    m_favor.save
  end

  def self.generate_define_law_mission(player, law)
    m_define = Mission.new
    m_define.mission_type = "Law Define"
    m_define.text = "Vote na #{law.title}"
    m_define.url = "/\#/law/#{law.id}"
    m_define.reference_id = law.id
    player.missions << m_define
    m_define.save
  end

  def self.generate_more_missions(player)
    # nada ainda
  end

end