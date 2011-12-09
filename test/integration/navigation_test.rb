require 'test_helper'

Capybara.register_driver :mobile do |app|
  Capybara::RackTest::Driver.new(app, :headers => {'HTTP_USER_AGENT' => 'Mobile'})
end

class NavigationTest < ActiveSupport::IntegrationCase
  test "truth" do
    assert_kind_of Dummy::Application, Rails.application
  end
  
  test "a computer requests m.lvh.me and mobile_html is rendered" do
    visit "http://m.lvh.me:3000/home"
    assert_equal 'text/html; charset=utf-8', headers['Content-Type']
    assert_match(/mobile_html/, page.body)
  end

  test "a computer requests localhost and html is rendered" do
    visit "http://localhost:3000/home"
    assert_match(/html/, page.body)
  end
  
  test "a mobile requests lvh.me and is redirects to m.lvh.me" do
    Capybara.current_driver = :mobile
    visit "http://lvh.me:3000/home"
    assert_match(/mobile_html/, page.body)
    Capybara.use_default_driver
  end
  
  test "a mobile requests m.localhost and an expception is raised" do
    Capybara.current_driver = :mobile
    assert_raise Exception do
      visit "http://m.localhost:3000/home"
    end
    Capybara.use_default_driver
  end
  
  protected
  
  def headers
    page.response_headers
  end
end
