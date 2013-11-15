require 'test_helper'

class ControllerControllerTest < ActionController::TestCase
  test "should get store" do
    get :store
    assert_response :success
  end

end
