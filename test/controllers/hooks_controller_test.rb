require 'test_helper'

class HooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get track" do
    get :track
    assert_response :success
  end

end
