require 'test_helper'

class Publics::NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_notifications_index_url
    assert_response :success
  end

end
