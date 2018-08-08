source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.6'
gem 'pg', '0.18.4'
# gem 'redis', '~> 3.0'
gem 'rest-client', '2.0.2'
gem 'haml-rails', '1.0.0'
gem 'data_migrate', '3.2.1'
gem 'active_model_serializers', '0.10.6'
gem 'database_cleaner'

#############
## Assets
#############
#gem 'webpacker', '3.0.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', '0.12.3', platforms: :ruby
gem 'carrierwave', '1.2.1'
gem 'carrierwave-serializable', '0.0.6'
gem 'carrierwave-base64', '2.6.1'

#############
## Deployment
#############
gem 'capistrano',         '~> 3.9.0'
gem 'capistrano-rbenv', '2.1.1'
gem 'capistrano-rails', '1.3.0'
gem 'capistrano-bundler', '1.2.0'
gem 'capistrano-scm-gitextended', '2.0.0'
gem 'capistrano-yarn', '2.0.2'
gem 'capistrano-bower', '1.1.0'


group :production do
  gem 'puma', '~> 3.7'
end

group :development, :test do
  #gem 'foreman', '0.84.0'
  gem 'rspec-rails', '>= 3.0.0' # adds spec generators
  gem 'rspec-set'
  gem 'consistency_fail'   # find missing indices
  gem 'factory_bot_rails' # DSL for building models under test
  gem 'faker'              # Create fake objects
  gem 'annotate'#, '2.7.0'
  platform :ruby do
    gem 'binding_of_caller'
    gem 'pry-rails', '0.3.4'
    gem 'pry-byebug', '3.2.0'
  end
end

group :development do
  gem 'thin'
  gem 'web-console', '>= 3.3.0'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-bundler'
end

group :test do
  gem 'rails-controller-testing'
  gem 'temping'
  gem 'webmock'
  gem 'sqlite3'
  gem 'capybara' # view testing
  gem 'shoulda-matchers',
      git: 'https://github.com/thoughtbot/shoulda-matchers.git',
      branch: 'rails-5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
