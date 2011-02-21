require 'compass'
require 'compass/app_integration/rails'

Haml::Template.options[:attr_wrapper] = '"'

Compass::AppIntegration::Rails.initialize!
