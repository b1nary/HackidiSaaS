require 'test_helper'

# Yes i know testing externaly stuff is bad practice
# But as we change some stuff within devise its better to be sure

class User::RegistrationsControllerTest < ActionDispatch::IntegrationTest

  test "can sign up, shows cant be blank stuff" do
    visit new_user_registration_path

    find('input[type="submit"]').click
    assert_equal [
      ["user_username", "can't be blank"],
      ["user_email", "can't be blank"],
      ["user_password", "can't be blank"]
    ], all_errors

    fill_in("user_username", with: "TestXY")
    fill_in("user_email", with: "testxy@email.com")
    fill_in("user_password", with: "password")
    fill_in("user_password_confirmation", with: "password")
    find('input[type="submit"]').click

    assert_equal 0, all('.help-block').count
    assert_equal "testxy@email.com", User.last.email
  end

  test "report taken username" do
    visit new_user_registration_path
    fill_in("user_username", with: "Hugo")
    find('input[type="submit"]').click
    assert_equal ["user_username", "has already been taken"], all_errors.first
  end

  test "report malformed username" do
    visit new_user_registration_path
    fill_in("user_username", with: "a[{}]")
    find('input[type="submit"]').click
    assert_equal ["user_username", "is invalid"], all_errors.first
  end

  test "report malformed email" do
    visit new_user_registration_path
    fill_in("user_username", with: "Hugo123")
    fill_in("user_email", with: "a[{}]")
    find('input[type="submit"]').click
    assert_equal ["user_email", "is invalid"], all_errors.first
  end

  test "enforce password limit" do
    visit new_user_registration_path
    fill_in("user_username", with: "Hugo123")
    fill_in("user_email", with: "a@asd.com")
    fill_in("user_password", with: "asdf")
    find('input[type="submit"]').click
    assert_equal ["user_password", "is too short (minimum is 8 characters)"], all_errors.first
  end

  test "expect similar passwords" do
    visit new_user_registration_path
    fill_in("user_username", with: "Hugo123")
    fill_in("user_email", with: "a@asd.com")
    fill_in("user_password", with: "this_is_a_long_password")
    fill_in("user_password_confirmation", with: "this_is_a_even_longer_password")
    find('input[type="submit"]').click
    assert_equal ["user_password_confirmation", "doesn't match Password"], all_errors.last
  end

  test "require password to change email address & be able to do so" do
    login_as(User.first, scope: :user)
    visit edit_user_registration_path
    fill_in("user_email", with: "b@asd.com")
    first('input[type="submit"]').click
    assert_equal ["user_current_password", "can't be blank"], all_errors.last
  end

  test 'user can change email & username' do
    User.first.update(password: "asdasdasd")
    login_as(User.first, scope: :user)
    visit edit_user_registration_path

    fill_in("user_email", with: "b@asd.com")
    fill_in("user_username", with: "asd.com")
    fill_in("user_current_password", with: "asdasdasd")
    first('input[type="submit"]').click

    assert_equal [], all_errors
    assert_equal "× Your account has been updated successfully.", find('.alert').text
    assert_equal "b@asd.com", User.first.email
    assert_equal "asd.com", User.first.username
  end

  private

  def all_errors
    all('.help-block').map{|e|
      [e.find(:xpath,"..").first('input')['id'], e.text]
    }
  end

end
