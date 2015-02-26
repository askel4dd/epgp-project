class EpgpParser 
  include ActiveModel::Model
  include ActiveModel::Validations
  
  attr_accessor :source
  attr_reader   :guild

  validate :json_format

  def json_format
    @source_data ||= JSON.parse(source)
    rescue JSON::ParserError
      errors.add(:source, "Wrong format")
  end

  def guild_owner(current_user)
    @source_data ||=JSON.parse(source)
    g = Guild.find_by(name: @source_data['guild'], region: @source_data['region'], realm: @source_data['realm'])
    return true if g.nil?
    return g.user == current_user ? true : false
  end

  def save(current_user)
    @guild = current_user.guilds.find_or_create_by(name: @source_data['guild'], region: @source_data['region'], realm: @source_data['realm'])
    @source_data['roster'].each do |player|
      @guild.epgps.find_or_create_by(effort_points: player[1], gear_points: player[2], recorded_at: @source_data['timestamp'], nickname: player[0])
    end
  end
end
