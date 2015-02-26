# Load the Rails application.
require File.expand_path('../application', __FILE__)

Rails::Initializer.run do |config|
  config.gem 'javan-whenever', :lib => false, :source => 'http://gem.github.com'
end

# Initialize the Rails application.
Rails.application.initialize!
