require "test_helper"

class ChannelCreatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get channel_creators_index_url
    assert_response :success
  end

  test "should get show" do
    get channel_creators_show_url
    assert_response :success
  end
end
