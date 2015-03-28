require 'test_helper'

class UploadersTest < ActionDispatch::IntegrationTest
  test "upload data for new guild" do
    upload_data(users(:one_gmail), '{"guild":"Undead and Fabulous","realm":"Crushridge","region":"us","roster":[["Agrypnotic",7767,1348],["Altra",6266,1970]],"timestamp":1297309021}')
    assert_equal current_path, uploader_path
    within '.starter-template' do
      assert has_content? Guild.last.name
    end
  end

  test "upload data for existing guild as not eligible user" do
    upload_data(users(:two_gmail), '{"guild":"Undead and Fabulous","realm":"Crushridge","region":"us","roster":[["Agrypnotic",7767,1348],["Altra",6266,1970]],"timestamp":1297309020}')
    logout(:user)
    upload_data(users(:one_gmail), '{"guild":"Undead and Fabulous","realm":"Crushridge","region":"us","roster":[["Agrypnotic",7767,1348],["Altra",6266,1970]],"timestamp":1297309021}')
    assert_equal Guild.find_by(name: "Undead and Fabulous").epgps.map(&:recorded_at).uniq.count, 1
  end

  test "upload not json data" do
    upload_data(users(:one_gmail), 'asdasd')
    within ".help-block" do
      assert has_content? "Wrong format"
    end
  end
end
