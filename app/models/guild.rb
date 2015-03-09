class Guild < ActiveRecord::Base
  has_many :epgps
  belongs_to :user

  def list_timestamps
    self.epgps.select(:recorded_at).map(&:recorded_at).uniq
  end

  def roster_on_timestamp(recorded_at)
    if recorded_at.present?
      self.epgps.where(recorded_at: recorded_at)
    else
      self.epgps.where(recorded_at: self.list_timestamps.max )
    end
  end

end
