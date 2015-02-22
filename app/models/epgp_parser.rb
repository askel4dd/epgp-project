class EpgpParser 
  include ActiveModel::Model
  attr_accessor :source 

  def validation
    true if source.include? 'a'
  end
end
