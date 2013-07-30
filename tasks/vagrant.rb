require 'erb'

def config
  accessKey = ENV["AWS_ACCESS_KEY_ID"]
  secretKey = ENV["AWS_SECRET_ACCESS_KEY"]

  raise "environment variable, AWS_ACCESS_KEY_ID, not defined!"     unless accessKey =~ /\S/
  raise "environment variable, AWS_SECRET_ACCESS_KEY, not defined!" unless secretKey =~ /\S/

  {
    :AWS_ACCESS_KEY_ID     => accessKey,
    :AWS_SECRET_ACCESS_KEY => secretKey
  }
end

def s3cfg 
  erb = ERB.new(File.open("templates/s3cfg.erb").read)
  erb.result binding
end

def update_sh
  erb = ERB.new(File.open("templates/update.sh.erb").read)
  erb.result binding
end

