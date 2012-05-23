# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Casino::Application.initialize!

Time::DATE_FORMATS[:default] = "%Y-%m-%dT%H:%M:%SZ"
