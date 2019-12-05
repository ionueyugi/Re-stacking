require 'test_helper'

class Publics::EvaluationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_evaluations_show_url
    assert_response :success
  end

end
