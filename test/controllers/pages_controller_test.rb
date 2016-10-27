require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "Main page" do
  	get root_path
    assert_response :success
  end
end
