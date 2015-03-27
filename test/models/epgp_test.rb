require 'test_helper'

class EpgpTest < ActiveSupport::TestCase
  def setup
    @one = epgps(:one)
  end

  test "loot_priority should return string" do
    assert @one.loot_priority.is_a? String
  end

  test "loot_priority output format must be .3f" do
    assert_equal @one.loot_priority, "2.500"
  end
end
