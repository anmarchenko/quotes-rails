unless Rails.env.test?
  Datadog.configure do |c|
    c.env = "local"
    c.service = "quotes-rails"
    c.telemetry.enabled = true
    c.agent.port = 8136
  end
end
