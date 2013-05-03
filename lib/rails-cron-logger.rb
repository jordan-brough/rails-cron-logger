require 'logger'
require 'rails-cron-logger/version'

module RailsCronLogger
  class Logger < Logger
    def initialize(options={})
      if options[:sync]
        # Flushes output on every write to avoid losing valuable output if the cron job crashes, etc.
        # see http://coderrr.wordpress.com/2008/12/20/automatically-flushing-redirected-or-piped-stdout/
        # Note that this is obviously an interpreter-wide setting we're changing here.
        # Really this ought to be set at a higher level than the code calling this logger (in the crontab
        # or in the crontab script that calls your code perhaps) but adding an option here for convenience.
        $stdout.sync = true
      end

      logdev = if options[:logdev].present?
                 options[:logdev]
               elsif Rails.env.test?
                 # don't want log messages for tests mixed in with test output
                 Rails.application.config.paths['log'].first
               else
                 $stdout
               end

      super(logdev)

      @formatter = Rails.logger.formatter
      @level     = Rails.logger.level
    end
  end
end
