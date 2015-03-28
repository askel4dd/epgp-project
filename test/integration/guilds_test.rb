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
end
