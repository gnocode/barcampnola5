require "./config/variables" unless Rails.env.production?

worker_processes ENV["UNICORN_WORKERS"].to_i
timeout ENV["UNICORN_TIMEOUT"].to_i
preload_app true

before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
    Rails.logger.info('Disconnected from ActiveRecord')
  end

  if defined?(Resque)
    Resque.redis.quit
    Rails.logger.info('Disconnected from Redis')
  end

  sleep 1
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
    Rails.logger.info('Connected to ActiveRecord')
  end

  if defined?(Resque)
    Resque.redis = ENV['REDIS_URI'] || ENV['REDIS_TO_GO']
    Rails.logger.info('Connected to Redis')
  end
end
