# encoding: utf-8

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

lib_dir_path = File.dirname(File.expand_path(__FILE__))
Motion::Project::App.setup do |app|
  app.files.concat(Dir.glob(File.join(lib_dir_path, "../motion/common/**/*.rb")))

  if App.template == :osx
    app.files.concat(Dir.glob(File.join(lib_dir_path, "../motion/osx/**/*.rb")))
  elsif App.template == :ios
    app.files.concat(Dir.glob(File.join(lib_dir_path, "../motion/ios/**/*.rb")))
  else
    raise "Incompatible platform: #{App.template}"
  end
end
