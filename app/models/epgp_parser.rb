class EpgpParser 
  include ActiveModel::Model
  include ActiveModel::Validations
  attr_accessor :source 
  
  validate :json_format

  def json_format
    @source_data ||= JSON.parse(source)
    rescue JSON::ParserError
      errors.add(:source, "Wrong format")
  end

  def parse
    @source_data ||= json_format
  end

end
