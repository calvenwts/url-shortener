require "test_helper"

class ViewsTest < ActionDispatch::IntegrationTest
  test "visiting a link records a view" do 
    link = links(:one)
    original_views_count = link.views_count
    assert_difference "View.count" do 
      assert_difference "link.reload.views_count" do
        get view_path(link)
        assert_response :redirect
      end
    end
  end

  test "visiting a link redirects to the URL" do 
    link = links(:one)
    get view_path(link)
    assert_redirected_to link.url
  end

  test "should handle non-existent link" do
    get view_path(id: 999_999)
    assert_redirected_to root_path
    assert_equal "Missing Link!", flash[:alert]
  end
end
