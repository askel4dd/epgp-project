class Player < ActiveRecord::Base
  belongs_to :guild
  has_many :epgps
end
