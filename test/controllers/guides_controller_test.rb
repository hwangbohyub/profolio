require 'test_helper'

class GuidesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get guides_home_url
    assert_response :success
  end

  test "should get guide1" do
    get guides_guide1_url
    assert_response :success
  end

  test "should get guide2" do
    get guides_guide2_url
    assert_response :success
  end

  test "should get guide3" do
    get guides_guide3_url
    assert_response :success
  end

  test "should get guide4" do
    get guides_guide4_url
    assert_response :success
  end

end
