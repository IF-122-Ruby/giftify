Sentry.init do |config|
  config.dsn = ENV['SENTRY_DSN']
  config.enabled_environments = ['production']
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  config.traces_sample_rate = 0.7
end
