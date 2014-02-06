source 'https://rubygems.org'
ruby '2.1.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'
# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'devise'
gem 'phony_rails'
gem 'figaro'
gem 'twilio-ruby'
gem 'chronic'

gem 'stripe', git: 'https://github.com/stripe/stripe-ruby'

gem 'sidekiq'
gem 'sinatra', '>= 1.3.0', require: nil
gem 'rollbar'
gem 'stamp'
gem 'pry'

gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test do
  gem 'faker'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

group :development, :test do
  gem "factory_girl_rails", "~> 4.0"
  gem 'debugger', '~>1.6.5'
  gem 'quiet_assets'
  gem 'rspec-rails', '~> 2.12'
end

group :production do
  gem 'rails_12factor'
  gem 'puma'
end

# Use Capistrano for deployment
# gem 'capistrano', group: :development

