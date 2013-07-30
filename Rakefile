require File.expand_path(File.dirname(__FILE__) + '/tasks/vagrant')
require File.expand_path(File.dirname(__FILE__) + '/tasks/env')

task :default => :up

desc "render scripts and other preparations"
task :prepare do 
  system "mkdir -p dist"
  File.open("dist/s3cfg", "w") do |io|
    io.puts s3cfg
  end
  File.open("dist/update.sh", "w") do |io|
    io.puts update_sh
  end
  system "chmod +x dist/update.sh"
end

namespace :vagrant do
  desc "vagrant up"
  task :up => :prepare do
    system "vagrant up"
  end
  
  desc "vagrant destroy"
  task :destroy do
    system "vagrant destroy"
  end
end

