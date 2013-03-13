## RailsCronLogger

### A logger for rails cron jobs that want output that is sent to standard out and is:

1. Formatted in the same way as Rails.logger
2. At the same log level as Rails.logger

### Example usage

    logger = RailsCronLogger::Logger.new
    logger.info "info"
    logger.debug "debug"

You can optionally supply a :logdev parameter to send the logs somewhere else, while keeping the formatting and log level of Rails.

    logger = RailsCronLogger::Logger.new(:logdev => '/some/log/path.log')

:logdev is the same type of argument as can be passed to the [normal Ruby Logger](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/logger/rdoc/Logger.html#method-c-new)

Note: In the test environment logs are sent to the normal Rails log device by default to avoid mixing log messages with test output.

### Note on flushing

You probably also want to set `$stdout.sync = true` in your crontab.

See http://coderrr.wordpress.com/2008/12/20/automatically-flushing-redirected-or-piped-stdout/

Example:

    1 * * * * rails runner '$stdout.sync = true; <your code here>'

Setting `$stdout.sync = true` in this gem seems a bit overreaching, but for convenience if you pass `:sync => true` to Logger.new then rails-cron-logger will perform this step for you.

Example:

    logger = RailsCronLogger::Logger.new(:sync => true)
