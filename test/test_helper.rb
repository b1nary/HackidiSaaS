ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'capybara/rails'

Capybara.javascript_driver = :webkit

class ActiveSupport::TestCase
  include Capybara::DSL
  include Warden::Test::Helpers
  fixtures :all

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
