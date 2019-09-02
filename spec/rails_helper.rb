# This file is copied to spec/ when you run 'rails generate rspec:install'
# require 'simplecov'
# SimpleCov.start do
#   add_filter "/spec"
# end
# Dir[Rails.root.join("spec/support/**/*.rb")].sort.each {|f| require f}
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Dir[File.join(__dir__, '../spec/helpers', '*.rb')].each { |file| require file }
# require_relative '../../spec/helpers/rails_helper.rb'
# require_relative '../../spec/helpers/spec_helper.rb'
require 'rspec/rails'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include Capybara::DSL
  config.before(:each) do
    DatabaseCleaner.clean
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include FactoryBot::Syntax::Methods
    config.after(:each) do
    # reset all FactoryBot sequences after each test
      FactoryBot.reload
    end
  end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end