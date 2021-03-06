source "https://rubygems.org"
ruby "2.5.5"
gem "rails", "4.2.11"
gem "pg", "~> 0.21"

# RAILS PROFILING
gem "rack-mini-profiler"
## memory profiling
gem "memory_profiler"
## call-stack profiling flamegraphs
gem "flamegraph"
gem "stackprof"

gem "sass-rails", "~> 4.0.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.0.0"
gem "jquery-rails"
gem "turbolinks"
gem "jbuilder", "~> 1.2"
gem "bootstrap-sass"
gem "cancan"
gem "devise"
gem "figaro"
gem "squeel"
gem "rolify"
gem "simple_form"
gem "nested_form"
gem "cocoon"
# gem 'thin'
gem "puma"
gem "fog"
gem "sidekiq"
gem "slim", ">= 1.1.0"
gem "sinatra", ">= 1.3.0", :require => nil
gem "seed_dump"
gem "rename"
gem "rails-erd"

# GEO Gems
gem "geocoder"
gem "gmaps4rails"

# Instant search on Home page
gem "algoliasearch-rails"
gem "hogan_assets"

# SEARCH gems
gem "algoliasearch"

# DESIGN AND FORMS Gems
gem "font-awesome-rails"
gem "icomoon-rails"
gem "bootstrap-datepicker-rails"
gem "datetimepicker-rails", :require => "datetimepicker-rails", :git => "git://github.com/zpaulovics/datetimepicker-rails.git"

gem "bootstrap_form"
gem "select2-rails", "~>3.5"
gem "selectize-rails"
gem "acts-as-taggable-array-on"
gem "twitter-typeahead-rails"

# IMAGES Gems
gem "fog-aws"
gem "carrierwave"
gem "mini_magick"
gem "carrierwave_backgrounder"
gem "carrierwave_direct"

# Spreadsheet
gem "rubyzip", "= 1.0.0"
gem "axlsx", "= 2.0.1"
gem "axlsx_rails"
gem "fast_excel"

# Console
gem "pry-byebug", platform: [:ruby_20]
gem "hirb"
gem "pry"
gem "pry-rails"
gem "rails_12factor", group: :production

group :development do
  gem "better_errors"
  gem "binding_of_caller", :platforms => [:mri_19, :mri_20, :rbx]
  gem "hub", :require => nil
  gem "quiet_assets"
  gem "rails_layout"
end
group :development, :test do
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "hirb"
end
group :test do
  gem "capybara"
  gem "cucumber-rails", :require => false
  gem "database_cleaner", "1.0.1"
  gem "email_spec"
  gem "launchy"
end
