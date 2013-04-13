source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'mongoid'
gem 'jquery-rails'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'

gem 'activeadmin-mongoid', :git => 'git://github.com/elia/activeadmin-mongoid.git'
gem 'devise'

group :development, :test do
    gem 'rspec-rails'
    gem 'bson_ext'
end

group  :test do
  gem 'factory_girl_rails'
  gem 'mongoid-rspec'
  gem 'cucumber-rails', :require => false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'faker'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end