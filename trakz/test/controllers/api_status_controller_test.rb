require "test_helper"

class ApiStatusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_status_index_url
    assert_response :success
  end
end
