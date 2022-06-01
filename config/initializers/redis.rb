$redis = Redis.new

url = ENV["redis://default:F6RlESnv64uydyMmWy328tmrVLVTWRjx@redis-14250.c3.eu-west-1-2.ec2.cloud.redislabs.com:14250"]

if url
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end
  $redis = Redis.new(:url => url)
end
