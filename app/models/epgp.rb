class Epgp < ActiveRecord::Base
  belongs_to :guild

  def loot_priority
    "%.3f" % ( self.effort_points.to_f / self.gear_points.to_f )
  end
end
