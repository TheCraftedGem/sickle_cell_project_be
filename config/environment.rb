# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.logger = Logger.new(STDOUT)
config.logger = ActiveSupport::Logger.new("log/#{Rails.env}.log")
config.log_tags = [:request_id]
Rails.logger.datetime_format = "%Y-%m-%d %H:%M:%S"
logger.formatter = proc do |severity, time, progname, msg |
  "#{datetime}, #{severity}: #{msg} FROM #{progname} \n"
end