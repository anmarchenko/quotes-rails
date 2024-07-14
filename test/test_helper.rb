ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "factory_bot_rails"

# Only activates test instrumentation on CI
if ENV["DD_ENV"] == "ci"
  require "datadog/ci"
  require "datadog/auto_instrument"

  Datadog.configure do |c|
    c.ci.enabled = true
    c.service = "quotes-rails"
    c.ci.instrument :minitest
  end
end

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods

    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
