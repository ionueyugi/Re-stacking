require 'test_helper'

class Admins::EvaluationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_evaluations_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_evaluations_show_url
    assert_response :success
  end

end
