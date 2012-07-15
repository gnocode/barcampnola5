# Load the rails application
require File.expand_path('../application', __FILE__)
ENV["RAILS_SECRET"] = "preferably a string resulting from 'rake secret'"

# Initialize the rails application
Barcampnola5::Application.initialize!
