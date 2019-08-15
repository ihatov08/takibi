require 'test_helper'

class BackersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get backers_new_url
    assert_response :success
  end

  test "should get create" do
    get backers_create_url
    assert_response :success
  end

end
