require 'test_helper'

class GuildTest < ActiveSupport::TestCase
  def setup
    @guild = guilds(:one)
  end

  test "roster_on_timestamp should return roster on max timestamp if params is not present" do
    assert_equal @guild.roster_on_timestamp(nil), @guild.epgps.where(recorded_at: 1421835611)
  end

  test "roster_on_timestamp should return roster on given timestamp in params" do
    assert_equal @guild.roster_on_timestamp("1420825500"), @guild.epgps.where(recorded_at: 1420825500)
  end

  test "list_timestamps should return array" do
    assert @guild.list_timestamps.is_a? Array
  end

  test "list_timestamps result array should contain only integers" do
    assert @guild.list_timestamps.all? { |d| d.is_a? Integer }
  end
end
