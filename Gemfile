source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'figaro'
gem 'bootstrap', '~> 4.0.0'
gem 'popper_js', '~> 1.12.9'
gem 'jquery-rails'
gem 'rspec-rails'
gem 'faraday'
gem 'webmock'
gem 'rails_12factor', group: :production
gem 'webpacker', '~> 3.0'
gem 'simplecov', :require => false, :group => :test
gem 'rack-cors', :require => 'rack/cors'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'database_cleaner'
  # gem 'factory_bot_rails', "~> 4.0"
  gem 'vcr'
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry'
  gem 'launchy'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
