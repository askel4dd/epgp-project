class EpgpParser 
  include ActiveModel::Model
  include ActiveModel::Validations
  attr_accessor :source

  validate :json_format

  def json_format
    @source_data ||= JSON.parse(source)
    save
    rescue JSON::ParserError
      errors.add(:source, "Wrong format")
  end

  def parse
    @source_data ||= json_format
  end

  def save
    current_guild = Guild.find_or_create_by(name: @source_data['guild'], region: @source_data['region'], server: @source_data['realm'])
    @source_data['roster'].each do |player|
      current_player = current_guild.players.find_or_create_by(nickname: player[0])
      current_player.epgps.find_or_create_by(ep: player[1], gp: player[2], recorded_at: @source_data['timestamp'])
    end
  end
end
