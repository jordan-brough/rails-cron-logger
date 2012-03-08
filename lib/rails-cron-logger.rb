require 'logger'
require 'rails-cron-logger/version'

module RailsCronLogger
  class Logger < Logger
    def initialize
      logdev = if Rails.env.test?
                 # don't want log messages for tests mixed in with test output
                 Rails.application.config.paths.log.first
               else
                 $stdout
               end

      super(logdev)

      @formatter = Rails.logger.formatter
      @level     = Rails.logger.level
    end
  end
end
