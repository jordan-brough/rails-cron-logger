# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rails-cron-logger/version"

Gem::Specification.new do |s|
  s.name        = "rails-cron-logger"
  s.version     = Rails::Cron::Logger::VERSION
  s.authors     = ["Jordan Brough"]
  s.email       = ["jordan@broughs.net"]
  s.homepage    = "https://github.com/jordan-brough/rails-cron-logger"
  s.summary     = "A logger for rails cron jobs"
  s.description = "See readme."

  s.rubyforge_project = "rails-cron-logger"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
