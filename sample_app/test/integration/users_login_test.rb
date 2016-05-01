require 'test_helper'


class UsersLoginTest < ActionDispatch::IntegrationTest

  # we create test  1) login with invalid data 2) get error message
  # 3) we want to see only one time this error message
 test "login with invalid information" do
   get login_path
   assert_template 'sessions/new'
   post login_path, session: { email: "", password: ""}
   assert_template 'sessions/new'
   assert_not flash.empty?
   get root_path
   assert flash.empty?
 end
end
