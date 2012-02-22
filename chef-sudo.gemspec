# -*- encoding: utf-8 -*-
# require File.expand_path("../lib/chef-sudo/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "chef-sudo"
  s.version     = "0.2.4"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mariusz Pietrzyk"]
  s.email       = ["wijet@wijet.pl"]
  s.homepage    = "http://github.com/wijet/chef-sudo"
  s.summary     = %Q{chef sudo resource}
  s.description = %Q{Provides chef sudo resource for executing commands with sudo}

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "chef-sudo"

  s.add_dependency "chef", ">= 0.9.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
