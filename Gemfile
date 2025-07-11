source "https://rubygems.org"

ruby "3.4.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.2.0"

# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Data stack based on sqlite
gem "litestack", "~> 0.4.2"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

# Observability
gem "datadog", require: "datadog/auto_instrument"
# gem "datadog-ci", path: "../../p/datadog-ci-rb"
# gem "datadog-ci", github: "DataDog/datadog-ci-rb", ref: "anmarchenko/impacted_tests_git_base_sha_v2"

# structured logging
gem "rails_semantic_logger", "~> 4.0"

group :development, :test do
  # # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri]

  # get IRB improvements faster
  gem "irb"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # linter and formatter
  gem "standard", "~> 1.39", require: false

  # lint plugins
  gem "rubocop-rails", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rubycw", require: false

  # language server protocol support
  gem "ruby-lsp"
  gem "ruby-lsp-rails"

  # render mails as HTML in development
  gem "letter_opener"

  # local dev tools
  gem "debugbar"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"

  # create objects on the fly
  gem "factory_bot_rails"
end
