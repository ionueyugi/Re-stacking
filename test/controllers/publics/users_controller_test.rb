require 'test_helper'

class Publics::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_users_show_url
    assert_response :success
  end

end
