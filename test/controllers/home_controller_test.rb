require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get home_main_url
    assert_response :success
  end

  test "should get my" do
    get home_my_url
    assert_response :success
  end

  test "should get pass" do
    get home_pass_url
    assert_response :success
  end

  test "should get all" do
    get home_all_url
    assert_response :success
  end

  test "should get guide" do
    get home_guide_url
    assert_response :success
  end

end
