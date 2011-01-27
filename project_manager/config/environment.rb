# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ProjectManager::Application.initialize!

require "core_ext/activerecord_base"
