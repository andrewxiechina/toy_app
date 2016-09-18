require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base =  " | Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home" + @base
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help" + @base
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About" + @base
  end

  test "should get projects" do
    get static_pages_projects_url
    assert_response :success
    assert_select "title", "Andrew Xie - The Pro Problem Solver"
  end

end