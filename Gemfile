source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.6'

gem 'unicorn', '4.3.1'

gem 'pg', '0.14.0', group: [:production, :staging]
gem 'sqlite3', '1.3.6', group: [:development, :test]
gem 'draper', '0.14.0'
gem 'sorcery', '0.7.12'
gem 'omniauth', '1.1.0'
gem 'jquery-rails', '2.0.2'
gem 'redcarpet', '2.1.1'
gem 'dalli', '2.1.0'

gem 'omniauth-facebook', '1.2.0'
gem 'omniauth-twitter', '0.0.12'
gem 'asset_sync', '0.4.2'

gem 'factory_girl_rails', '3.5.0', group: [:development, :test]
gem 'forgery', '0.5.0', group: [:development, :test]

group :production do
  gem 'newrelic_rpm', '3.4.0.1'
end


group :development do
  gem 'foreman', '0.47.0'
  gem 'pry-rails', '0.1.6'
  gem 'quiet_assets', '1.0.1'
  gem 'vendorer', '0.1.11'
end

group :assets do
  gem 'sass-rails', '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.6'
end
