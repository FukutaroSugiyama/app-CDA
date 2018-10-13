require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get total" do
    get posts_total_url
    assert_response :success
  end

end
