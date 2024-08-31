require 'test_helper'

class ShortCodeTest < ActiveSupport::TestCase
  test "encode valid number" do
    assert_equal "b", ShortCode.encode(11)
    assert_equal "1Z", ShortCode.encode(123)
    assert_equal "aZ", ShortCode.encode(681)
  end

  test "encode zero" do
    assert_equal "0", ShortCode.encode(0)
  end

  test "encode invalid number" do
    assert_raises(ArgumentError) { ShortCode.encode(-1) }
    assert_raises(ArgumentError) { ShortCode.encode(nil) }
    assert_raises(ArgumentError) { ShortCode.encode("string") }
  end

  test "decode valid string" do
    assert_equal 11, ShortCode.decode("b")
    assert_equal 123, ShortCode.decode("1Z")
    assert_equal 681, ShortCode.decode("aZ")
  end

  test "decode invalid string" do
    assert_raises(ArgumentError) { ShortCode.decode("1!") }  
    assert_raises(ArgumentError) { ShortCode.decode(" ") }
    assert_raises(ArgumentError) { ShortCode.decode(nil) }
  end

  test "round trip" do
    number = 123456789
    assert_equal number, ShortCode.decode(ShortCode.encode(number))
  end
end
