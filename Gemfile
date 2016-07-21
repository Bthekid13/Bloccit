source "https://rubygems.org"

gem 'rails', '4.2.5'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'sqlite3'
end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem "codeclimate-test-reporter", group: :test, require: nil
end

#base gems
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass'
gem 'figaro', '1.0'
gem 'bcrypt'

# additions
gem "annotate"
gem "faker"
