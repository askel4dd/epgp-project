require 'test_helper'

class EpgpTest < ActiveSupport::TestCase
  def setup
    @epgp_for_zelda = epgps(:epgp_for_zelda)
  end

  test "loot_priority return string" do
    assert @epgp_for_zelda.loot_priority.is_a? String
  end

  test "loot_priority output format .3f" do
    assert_equal @epgp_for_zelda.loot_priority, "2.500"
  end
end
