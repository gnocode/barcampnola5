source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.6'

gem 'unicorn', '4.3.1'

gem 'jquery-rails', '2.0.2'

gem 'pg', '0.14.0', group: [:production, :staging]
gem 'sqlite3', '1.3.6', group: [:development, :test]

# Full text  search
gem 'thinking-sphinx', '2.0.10'

group :development do
  gem 'foreman', '0.47.0'
  gem 'pry-rails', '0.1.6'
  gem 'quiet_assets', '1.0.1'
  # To use debugger
  # gem 'debugger'
  # gem 'heroku'
end

group :assets do
  gem 'sass-rails',   '3.2.3'
  gem 'coffee-rails', '3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '1.0.3'
end

