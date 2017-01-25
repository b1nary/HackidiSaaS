require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get impressum" do
    get impressum_url
    assert_response :success
  end

  test "should get privacy policy" do
    get privacy_policy_url
    assert_response :success
  end
end
