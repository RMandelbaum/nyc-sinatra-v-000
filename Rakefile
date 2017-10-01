ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'


# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  Pry.start
end

task :drop do
  system('rm db/nycdevelopment.sqlite && rm db/schema.rb && rm db/nyctest.sqlite')
end

task :migrations do
  system('rake db:migrate && rake db:migrate SINATRA_ENV=test')
end
