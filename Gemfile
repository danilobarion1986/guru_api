# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
gem 'active_model_serializers', '~> 0.10.0'
gem 'sequel'
gem 'sequel-rails'
gem 'tiny_tds', '1.3.0'
gem 'versionist'
gem 'dotenv-rails'
gem 'sequel-asterisk-hunter'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec'
  gem 'rubocop', require: false
  gem 'rubocop-checkstyle_formatter', require: false
  gem 'rubocop-rspec'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'puma', '~> 3.11'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-bundler-audit'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda-matchers', '~> 2.8.0'
  gem 'simplecov'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'webmock'
end

group :production do
  gem 'unicorn', '~> 4.8.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
