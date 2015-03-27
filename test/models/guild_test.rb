require 'test_helper'

class GuildTest < ActiveSupport::TestCase
  def setup
    @guild = guilds(:one)
  end

  test "roster_on_timestamp should return roster on max timestamp if params is not present" do
    assert_equal @guild.roster_on_timestamp, @guild.epgps.where(recorded_at: 1421835611)
  end

  test "roster_on_timestamp should return roster on given timestamp in params" do

  end
end
