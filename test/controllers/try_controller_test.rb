require 'test_helper'

class TryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get try_new_url
    assert_response :success
  end

end
