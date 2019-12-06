# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bcrypt', '3.1.13'
gem 'bootsnap', '>= 1.1.0'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'bootstrap-will_paginate', '~> 1.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.7'
gem 'jquery-rails', '~> 4.3'
gem 'faker', '~> 2.6.0'
gem 'jbuilder', '~> 2.5'
gem 'popper_js', '~> 1.14.5'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.2.0'
gem 'sass-rails', '~> 5.0'
gem 'sprockets-rails', require: 'sprockets/railtie'
gem 'sqlite3'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate', '~> 3.2.1'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.8'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'webdrivers', '~> 4.0'
  #  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
