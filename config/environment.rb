# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Coop::Application.initialize!

if "irb" == $0
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveSupport::Cache::Store.logger = Logger.new(STDOUT)
end
