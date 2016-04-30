require 'test_helper'

class EplControllerTest < ActionController::TestCase
  test "should get chelsea" do
    get :chelsea
    assert_response :success
  end

end
