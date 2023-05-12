require "minitest/autorun"
require "rcv_deeplink"

class RcvDeeplinkTest < Minitest::Test

  def test_path
    # default to anchoring at verse 1
    assert_equal RcvDeeplink.path(1,1), "01_Genesis_1.htm#Gen1-1"
    # pass in a different verse anchor
    assert_equal RcvDeeplink.path(1,1,5), "01_Genesis_1.htm#Gen1-5"
    # pass in zero as a verse number to anchor on the chapter as a whole
    assert_equal RcvDeeplink.path(1,1,0), "01_Genesis_1.htm#Gen1"

    assert_equal RcvDeeplink.path(9,1), "09_1Samuel_1.htm#FSa1-1"
  end

  def test_url
    assert_equal RcvDeeplink.url(1,1), RcvDeeplink::URL + "01_Genesis_1.htm#Gen1-1"
  end
end
