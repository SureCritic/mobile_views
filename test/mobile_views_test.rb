require 'test_helper'

class MobileViewsTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, MobileViews
  end
  
  test "mobile_html mime type" do
    assert_equal :mobile_html, Mime::MOBILE_HTML.to_sym
    assert_equal "text/html", Mime::MOBILE_HTML.to_s
  end
end
