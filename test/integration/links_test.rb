require "test_helper"

class LinksTest < ActionDispatch::IntegrationTest
  test "links index" do 
    get links_path
    assert_response :ok
  end

  test "links index pagination" do 
    get links_path(page: 2)
    assert_response :ok
  end

  test "link show" do 
    get link_path(links(:one))
    assert_response :ok
  end

  test "create link requires a url" do
    post links_path, params: { link: { url: ""} }
    assert_response :unprocessable_entity 
  end

  test "create a link" do
    assert "Link.count" do
      post links_path(format: :turbo_stream), params: { link: {url: "https:google.com"}}
      assert_response :ok 
      assert_nil Link.last.user_id
    end
  end
end
