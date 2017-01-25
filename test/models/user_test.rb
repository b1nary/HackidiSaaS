require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'email address can only be used once' do
    usr = User.create(username: "test", email: "frank@email.com", password: "Password")
    assert_equal({email: ["has already been taken"]}, usr.errors.messages)
  end

  test 'Password limit is enforced' do
    usr = User.create(username: "test", email: "test@email.com", password: "Pass")
    assert_equal({password: ["is too short (minimum is 6 characters)"]}, usr.errors.messages)
  end

  test 'Username is required' do
    usr = User.create(email: "test@email.com", password: "Password")
    assert_equal({username: ["can't be blank"]}, usr.errors.messages)
  end

  test 'Username is unique and ignores case' do
    usr = User.create(username: "frank", email: "test@email.com", password: "Password")
    assert_equal({username: ["has already been taken"]}, usr.errors.messages)

    usr = User.create(username: "FrAnK", email: "test@email.com", password: "Password")
    assert_equal({username: ["has already been taken"]}, usr.errors.messages)
  end
end
