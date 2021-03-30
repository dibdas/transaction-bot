source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'devise', '~> 4.7', '>= 4.7.3'

gem 'rails', '~> 6.1.3'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'sass-rails', '>= 6'

gem 'webpacker', '~> 5.0'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.7'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'carrierwave', '~> 2.0'
gem 'cloudinary'
gem 'image_processing', '~>1.2'
gem 'mini_magick'
group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 3.34'
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 4.4', '>= 4.4.1'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'web-console', '>= 4.1.0'

  gem 'spring'
end

group :test do
  gem 'selenium-webdriver'

  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
