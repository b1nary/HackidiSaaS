require 'test_helper'

# Yes i know testing externaly stuff is bad practice
# But as we change some stuff within devise its better to be sure

class User::SessionsControllerTest < ActionDispatch::IntegrationTest

  test 'User can login' do
    User.first.update(email: "test@test.com", password: "testtest")

    visit new_user_session_path
    fill_in("user_login", with: "test@test.com")
    fill_in("user_password", with: "testtest")
    find('input[type="submit"]').click

    assert_equal "× Signed in successfully.", find('.alert').text
  end

  test 'User can signout again' do
    login_as(User.first, scope: :user)
    visit root_path

    click_link 'Logout'
    assert_equal "× Signed out successfully.", find('.alert').text
  end

end
