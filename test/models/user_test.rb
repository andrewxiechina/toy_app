require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User", email: "example@user.com")
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
end
