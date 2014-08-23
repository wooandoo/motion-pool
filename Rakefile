# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")

# Test with:
# - PLATFORM=osx rake spec
# - PLATFORM=ios rake spec
platform = ENV.fetch('PLATFORM', 'osx')
if platform == 'osx'
  require 'motion/project/template/osx'
elsif platform == 'ios'
  require 'motion/project/template/ios'
else
  raise "Unsupported platform #{platform}"
end

require './lib/motion-pool'

begin
  require 'bundler'
  require 'motion/project/template/gem/gem_tasks'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'motion-pool'
  
  app.specs_dir = './spec'
  app.spec_files
end
