source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'


gem 'administrate'
gem 'simple_command'
gem 'lograge'
gem 'csv'
gem 'htmltoword'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'fast_jsonapi'
gem 'rack-cors', require: 'rack/cors'
gem 'jwt'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'fuubar'
  gem 'simplecov'
  gem "factory_bot_rails"
  gem "launchy"
  gem 'pry'
  gem 'faker'
  gem 'database_cleaner'
  gem 'webmock'
  gem 'vcr'
  gem 'capybara'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end