class Epgp < ActiveRecord::Base
  belongs_to :guild

  def loot_priority
    "%.3f" % ( self.ep.to_f / self.gp.to_f )
  end
end
