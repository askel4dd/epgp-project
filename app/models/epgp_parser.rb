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

  def save
    @guild = Guild.find_or_create_by(name: @source_data['guild'], region: @source_data['region'], server: @source_data['realm'])
    @source_data['roster'].each do |player|
      @guild.epgps.find_or_create_by(effort_points: player[1], gear_points: player[2], recorded_at: @source_data['timestamp'], nickname: player[0])
    end
  end
end
