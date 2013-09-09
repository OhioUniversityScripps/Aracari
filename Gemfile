source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'jquery-rails'

gem 'paperclip', "~> 3.0"

gem 'has_barcode'

gem 'jiffy_enums'

gem 'activeadmin', github: 'gregbell/active_admin'
gem 'devise'
gem 'thin'

gem 'prettyphoto-rails'

group :development do
  gem 'ruby_gntp'

  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-fsevent', :require => false

  # gem 'pry'
  # gem 'pry-remote'
  gem 'pry-rails'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
end

group  :test do
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'capybara'
  gem 'faker'
  gem 'database_cleaner'
end

group :production do
  gem 'pg'
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