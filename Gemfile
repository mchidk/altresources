source 'http://rubygems.org'

gem 'mysql2', "< 0.3.0"
gem 'sqlite3'

gem 'e9_base',       :path => 'vendor/e9_base'
gem 'e9_attributes', :path => 'vendor/e9_base/engines/e9_attributes'
gem 'e9_crm',        :path => 'vendor/e9_base/engines/e9_crm'
gem 'e9_polls',      :path => 'vendor/e9_base/engines/e9_polls'
gem 'e9_tags',       :path => 'vendor/e9_base/engines/e9_tags'
gem 'e9_vendors',    :path => 'vendor/e9_base/engines/e9_vendors'

group :production do
  gem 'redis', '2.2.0'
  gem 'redis-store', "1.0.0.beta5"
  gem 'fog'
  gem 'unicorn', '~> 3.6.1'
end
