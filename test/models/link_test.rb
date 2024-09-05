require "test_helper"

class LinkTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  def setup
    @link_one = links(:one)
    @link_two = links(:two)
    @invalid_link = links(:invalid)
  end

  test "should be valid with a valid URL" do
    assert @link_one.valid?
    assert @link_two.valid?
  end

  test "should be invalid without a URL" do
    @link_one.url = nil
    assert_not @link_one.valid?
  end

  test "recent_first scope should return links in the correct order" do
    assert_equal [@invalid_link, @link_two, @link_one], Link.recent_first
  end

  test "should return the correct domain" do
    assert_equal "facebook.com", @link_one.domain
    assert_equal "google.com", @link_two.domain
  end

  test "to_param should return the encoded ID" do
    assert_equal ShortCode.encode(@link_one.id), @link_one.to_param
  end

  test "find_by_short_code should return the correct link" do
    found_link = Link.find_by_short_code(ShortCode.encode(@link_one.id))
    assert_equal @link_one, found_link
  end

  test "should trigger MetadataJob after save if URL has changed" do
    @link_one.url = "https://newexample.com"
    assert_enqueued_with(job: MetadataJob) do
      @link_one.save
    end
  end
end
