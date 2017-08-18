require 'test_helper'

class MentorControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get mentor_home_url
    assert_response :success
  end

end
