require "test_helper"

class ViewTest < ActiveSupport::TestCase
  def setup
    Geocoder.configure(lookup: :test, ip_lookup: :test)
    @link = links(:one)
    @view = @link.views.build(ip: "192.1.1.1")

    Geocoder::Lookup::Test.add_stub(
      "192.1.1.1", [
        {
          'coordinates'  => [37.7749295, -122.4194155],
          'address'      => 'San Francisco, CA, USA',
          'city'         => 'San Francisco',
          'state'        => 'California',
          'state_code'   => 'CA',
          'country'      => 'United States',
          'country_code' => 'US'
        }
      ]
    )

    Geocoder::Lookup::Test.set_default_stub(
      [
        {
          'coordinates'  => [0, 0],
          'city'         => nil,
          'state'        => nil,
          'country'      => nil
        }
      ]
    )
  end
  
  test "should be valid with valid attributes" do
    assert @view.valid?
  end

  test "should belong to a link" do
    assert_equal @link, @view.link
  end

  test "should increase views_count on link after creation" do
    assert_difference '@link.reload.views_count', 1 do
      @view.save
    end
  end

  test "should return correct city for the IP address" do
    assert_equal "San Francisco", @view.city
  end

  test "should return correct country for the IP address" do
    assert_equal "United States", @view.country
  end

  test "should return nil if no location found for city" do
    Geocoder::Lookup::Test.delete_stub("192.1.1.1")
    assert_nil @view.city
  end

  test "should return nil if no location found for country" do
    Geocoder::Lookup::Test.delete_stub("192.1.1.1")
    assert_nil @view.country
  end
end
