require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest


  # test "invalid signup information" do      -> old version
  #       get signup_path
  #       before_count = User.count
  #       post users_path, user: {name: "", nickname: "", email: "user_invalid", password: "abs", password_confirmation: "cde" }
  #       after_count = User.count
  #       assert_equal before_count, after_count
  #       assert_template 'users/new'
  # end

test "invalid signup information" do
      get signup_path
      # assert that the count of users will not change because we aren't able to create user with the data below
          assert_no_difference "User.count" do
          post users_path, user: {name: "", nickname: "", email: "user_invalid",
          password: "abs", password_confirmation: "cde" }
          end
      assert_template 'users/new'
end

test "valid signup information" do
      get signup_path
      # assert that the count of users will not change because we aren't able to create user with the data below
          assert_difference "User.count", 1  do
          post_via_redirect users_path, user: {name: "James",
                                                              nickname: "Trumble",
                                                                     email: "Jtrumble@gmail.com",
                                                               password: "123456789",
                                        password_confirmation: "123456789" }
          end
      # follow_redirect!
      # assert_template 'users/show'
      # assert is_logged_in?
end




end
