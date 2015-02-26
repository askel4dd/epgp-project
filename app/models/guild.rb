class Guild < ActiveRecord::Base
  has_many :epgps
  belongs_to :user

  def list_timestamps
    self.epgps.select(:recorded_at).map(&:recorded_at).uniq
  end
end
