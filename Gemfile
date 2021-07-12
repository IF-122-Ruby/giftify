source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'

gem 'any_login'
gem 'active_record_union'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'carrierwave'
gem 'mini_magick'
gem 'ckeditor'
gem 'devise'
gem 'will_paginate'
gem 'elasticsearch', '~> 7.13', '>= 7.13.1'
gem 'elasticsearch-model'
gem 'factory_bot_rails'
gem 'faker'
gem 'jbuilder', '~> 2.7'
gem 'meta-tags'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'react_on_rails'
gem 'sass-rails', '>= 6'
gem 'simple_form'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'
gem 'sentry-ruby'
gem 'sentry-rails'
gem 'sentry-sidekiq'
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'activerecord-import'
gem 'ransack'
gem "chartkick"
gem 'groupdate'
gem 'telegram-bot'
gem 'redis-rails'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'

gem 'caxlsx'
gem 'caxlsx_rails'

group :development, :test do
  gem 'annotate'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'pry'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'simplecov', require: false
  gem 'rails-controller-testing'
  gem "timecop"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'capistrano', '~> 3.11'
  gem 'capistrano-rails', '~> 1.4'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4'
  gem 'capistrano-sidekiq'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'mini_racer', platforms: :ruby
