require 'database_cleaner'

RSpec.configure do |config|
  config.before(:suite) do
    # DatabaseCleaner.strategy = :truncation
    DatabaseCleaner[:mongoid].strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end
end