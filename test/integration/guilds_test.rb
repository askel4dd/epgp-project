require 'test_helper'

class GuildsTest < ActionDispatch::IntegrationTest
  test "guild index show all guilds" do
    visit guilds_path
    within ".starter-template" do
      assert_equal all('a').count, Guild.all.count
    end
  end

  test "guild show render roster for latest timestamp" do
    visit guild_path(guilds(:mesmerize))
    within 'tbody' do
      assert has_content? (epgps(:epgp_for_sanic).nickname)
    end
  end

  test "guild drop-down button show all uniq timestamps" do
    visit guild_path(guilds(:mesmerize))
    within '.scrollable-menu' do
      assert has_content? (epgps(:epgp_for_yolo).recorded_at)
      assert has_content? (epgps(:epgp_for_sanic).recorded_at)
    end
  end

  test "guild show correct info with spec timestamp" do
    visit guild_path(guilds(:mesmerize))
    click_link '1420825500'
    assert_equal current_path, guild_timestamp_path(guilds(:mesmerize), epgps(:epgp_for_yolo).recorded_at)
    within 'tbody' do
      assert has_content? (epgps(:epgp_for_yolo).nickname)
      assert has_content? (epgps(:epgp_for_zelda).nickname)
    end
  end
end
