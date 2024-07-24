ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "factory_bot_rails"

# Only activates test instrumentation on CI
if ENV["DD_ENV"] == "ci"
  require "datadog/ci"

  Datadog.configure do |c|
    c.ci.enabled = true
    c.service = "quotes-rails"
    c.ci.instrument :minitest

    c.tracing.instrument :active_record
    c.tracing.instrument :active_support
    c.tracing.instrument :action_cable
    c.tracing.instrument :action_mailer
    c.tracing.instrument :action_view
    c.tracing.instrument :active_job
  end
end

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def sign_in_as(user)
    post(sign_in_url, params: {email: user.email, password: "Secret1*3*5*"})
    user
  end
end
