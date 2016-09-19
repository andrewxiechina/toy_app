require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User",
      email: "example@user.com",
      password: "foobar",
      password_confirmation: "foobar")
  end

  test "simple user should be valid" do
    assert @user.valid?
  end

  test "should reject empty name" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "name should not exceed 50" do
    @user.name = 'a'*51
    assert_not @user.valid?
  end

  test "validates email pattern" do
    valid_addresses = %w[user@example.com
                        USER@foo.COM
                        A_US-ER@foo.bar.org
                        first.last@foo.jp
                        alice+bob@baz.cn]
    valid_addresses.each do |i|
      @user.email = i
      assert @user.valid?
    end
  end

  test "email should not duplicate" do
    duplicated_user = @user.dup
    duplicated_user.email = @user.email.upcase
    @user.save
    assert_not duplicated_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
