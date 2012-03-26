require 'test_helper'

class ScraperControllerTest < ActionController::TestCase
  test "should get images_for_url" do
    get :images_for_url
    assert_response :success
  end

end
