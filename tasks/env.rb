S3_BUCKET = ENV["S3_BUCKET"]

raise "environment variable, S3_BUCKET, not defined!" unless S3_BUCKET =~ /\S/

