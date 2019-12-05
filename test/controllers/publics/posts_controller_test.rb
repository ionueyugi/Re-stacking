require 'test_helper'

class Publics::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_posts_show_url
    assert_response :success
  end

end
