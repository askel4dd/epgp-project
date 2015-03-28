require 'test_helper'

class GuildTest < ActiveSupport::TestCase
  def setup
    @guild = guilds(:mesmerize)
  end

  test "roster_on_timestamp return roster on max timestamp when params is not present" do
    assert_equal @guild.roster_on_timestamp(nil), @guild.epgps.where(recorded_at: 1421835611)
  end

  test "roster_on_timestamp return roster on given timestamp" do
    assert_equal @guild.roster_on_timestamp("1420825500").to_a, epgps(:epgp_for_yolo,:epgp_for_zelda)
  end

  test "list_timestamps return array" do
    assert @guild.list_timestamps.is_a? Array
  end

  test "list_timestamps result array contain only integers" do
    assert @guild.list_timestamps.all? { |d| d.is_a? Integer }
  end
end
