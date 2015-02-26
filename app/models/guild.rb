class Guild < ActiveRecord::Base
  has_many :epgps
  belongs_to :user
end
