require 'test_helper'


class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:micky)
  end

  # we create test  1) login with invalid data 2) get error message
  # 3) we want to see user page, and logout and user link , we don't want see login link
 test "login with invalid information" do
   get login_path
   assert_template 'sessions/new'
   post login_path, session: { email: "", password: ""}
   assert_template 'sessions/new'
   assert_not flash.empty?
   get root_path
   assert flash.empty?
 end

 # we create test  1) login with valid data 2) get error message
 # 3) we want to see only one time this error message
test "login with valid information" do
  get login_path
  post login_path, session: { email: @user.email, password: "password"}
  assert_redirected_to @user
  follow_redirect!
  assert_template 'users/show'
  assert_select "a[href=?]", login_path, count: 0
  assert_select "a[href=?]", logout_path
  assert_select "a[href=?]", user_path(@user)
end
end
