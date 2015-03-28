require 'test_helper'

class EpgpParserTest < ActiveSupport::TestCase
 def setup 
   @uploader = EpgpParser.new
   @uploader.source = '{"guild":"Aware","realm":"Defias Brotherhood","region":"eu","roster":[["Abalith",10116,1736],["Anydia",17571,2891],["Ascl\u00e9pius",9558,407],["Browndiamond",228,1],["Byulshin",7938,1082],["Cacha\u00e7a",884,1]],"timestamp":1424804640}'
 end

 test "json_format return true value if given data is valid" do
   assert @uploader.json_format
 end

 test "json_format return error if given data is invalid" do
   @uploader.source = "test"
   @uploader.json_format
   assert @uploader.errors.any?
 end

 test "json_format do not add error if given data is valid" do
   @uploader.json_format
   assert !@uploader.errors.any?
 end

 test "guild_owner return true if guild in source data does not exist in database" do
   @uploader.source = '{"guild":"Fargo","region":"eu","realm":"Warsong"}'
   assert @uploader.guild_owner(users(:one_gmail))
 end

 test "guild_owner return true if current_user and guild owner user equal" do
   @uploader.source = '{"guild":"Mesmerize","region":"EU","realm":"Shadowmoon"}'
   assert @uploader.guild_owner(users(:one_gmail))
 end

 test "guild_owner return false if current_user does not equal guild owner user" do
   @uploader.source = '{"guild":"Mesmerize","region":"EU","realm":"Shadowmoon"}'
   assert !@uploader.guild_owner(users(:two_gmail))
 end

 test "guild saved for current_user" do
   @uploader.json_format
   @uploader.save(users(:one_gmail))
   guild = Guild.find_by(name: "Aware", region: "eu", realm: "Defias Brotherhood")
   assert_equal guild.user, users(:one_gmail)
 end
end
