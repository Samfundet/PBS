###########################################
# NOTHING GOES IN HERE WITHOUT A COMMENT! #
###########################################

# The repository from which we're fetching our rubygems.
source 'https://rubygems.org'

# Rails. Duh.
gem 'rails', '3.2.11'

# Haml is a templating language. It compiles to HTML.
gem 'haml-rails'

# formtastic is a Rails form builder plugin
# with semantically rich and accessible markup.
# formtastic-bootstrap is a gem built on top of
# this to create markup which adheres to bootstrap.
gem 'formtastic-bootstrap'

# A gem handling file uploading and attatching them to models
gem 'paperclip'

# rails-translate-routes is a gem which provides the application
# with translated routes in accordance with a user-defined,
# yaml-style dictionary.
gem 'rails-translate-routes'

# Bootstrap is a toolkit from Twitter designed to kickstart development
# of webapps and sites. It includes base CSS and HTML for typography,
# forms, buttons, tables, grids, navigation, and more.
gem 'twitter-bootstrap-rails'

# SamfundetDomain is a gem which provides the application with samfundets domain models.
gem 'samfundet_domain', :git => "git://github.com/Samfundet/SamfundetDomain.git"

# SamfundetAuth is a gem which provides the application with methods for authenticating against mdb2.
gem 'samfundet_auth', :git => "git://github.com/Samfundet/SamfundetAuth.git"

# Offers a declarative approach to user authorization.
gem 'declarative_authorization'

# A simple date validator for Rails 3.
gem 'date_validator'

# jquery-rails provides the jQuery and jQuery UI JavaScript files,
# as well as the UJS (Unobtrusive JavaScript) adapter.
gem 'jquery-rails'

# jquery-ui-rails provides the jQuery UI assets (JS, stylesheets, images).
gem 'jquery-ui-rails'

gem 'jquery_datepicker'
gem 'rb-readline'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'

  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
   gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  gem 'less-rails'
end

group :test do
  # See below (:development)
  gem 'sqlite3'

  # Cucumber is a BDD testing framework.
  gem 'cucumber'

  # The RSpec testing framework.
  gem 'rspec'
end

group :development do
  # annotate adds schema information from the database, in the form of
  # Ruby comments, to model files so that we can see which columns
  # are actually in the database.
  gem 'annotate'

  # Faker is a library that generates fake data (names, email addresses, etc.)
  gem 'faker'

  # SQLite adapter. See: config/database.yml
  gem 'sqlite3'

  # WEBrick is a Ruby library providing simple HTTP web server services.
  gem 'webrick'
end

group :production do
  # PostgreSQL adapter. See: config/database.yml
  gem 'pg'
end
