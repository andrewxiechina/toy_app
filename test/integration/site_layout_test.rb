require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "header layout" do
    get root_path
    assert_template "static_pages/home"
    assert_select "a[href=?]", root_path, count: 2

    get help_path
    assert_select "title", translateToTitle("Help")
  end
end
