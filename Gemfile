source "https://rubygems.org"

ruby "3.3.1"

gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", ">= 4.0.1"
gem "kredis"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "image_processing", "~> 1.2"
gem 'tailwindcss-rails', '~> 2.6'
gem 'devise', '~> 4.9', '>= 4.9.4'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]

  gem 'ffaker', '~> 2.23'
  gem 'rspec', '~> 3.13'
  gem 'rspec-rails', '~> 6.1', '>= 6.1.2'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'factory_bot', '~> 6.4', '>= 6.4.6'
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.3'
end

group :test do
  gem 'shoulda-matchers', '~> 6.2'
  gem 'capybara', '~> 3.40'
  gem 'webdrivers'
end

group :development do
  gem "web-console"
end

