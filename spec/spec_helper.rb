# encoding: UTF-8

ENV["RAILS_ENV"] ||= "test"

PROJECT_ROOT = File.expand_path("../..", __FILE__)
$LOAD_PATH << File.join(PROJECT_ROOT, "lib")

require 'rails/all'
require 'rails/test_help'
Bundler.require

require 'diesel/testing'
require 'rspec/rails'

require 'factory_girl_rails'
require 'timecop'

require 'watchmaker'

require 'simplecov'
SimpleCov.start

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.backtrace_clean_patterns << %r{gems/}
end
