## RailsCronLogger

### A logger for rails cron jobs that want output that is:

1. Formatted in the same way as Rails.logger
2. At the same log level as Rails.logger
3. Sent to stdout, except in test mode

### Example usage

    logger = RailsCronLogger::Logger.new
    logger.info "info"
    logger.debug "debug"

### Note on flushing

You probably also want to set `$stdout.sync = true` in your crontab.

See http://coderrr.wordpress.com/2008/12/20/automatically-flushing-redirected-or-piped-stdout/

Example:

    1 * * * * rails runner '$stdout.sync = true; <your code here>'

Setting `$stdout.sync = true` in this gem seems like it would be a bit overreaching.
