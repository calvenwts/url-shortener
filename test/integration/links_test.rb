require "test_helper"

class LinksTest < ActionDispatch::IntegrationTest
  test "links index" do 
    get links_path
    assert_response :ok
  end

  test "links index pagination" do 
    50.times { Link.create!(url: "https:example.org") }
    get links_path
    assert_response :ok
    assert_select "span", "‹ Prev"
  end

  test "links index handles pagination overflow" do 
    Link.destroy_all
    get links_path(page: 2)
    assert_redirected_to root_path
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
