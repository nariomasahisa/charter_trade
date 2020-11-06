require 'test_helper'

class ChartersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get charters_index_url
    assert_response :success
  end

end
