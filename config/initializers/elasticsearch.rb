if Rails.env.development?
  url = ENV["ELASTICSEARCH_URL"]
  transport_options = { request: { timeout: 250 } }
  options = { hosts: url, retry_on_failure: true, transport_options: transport_options }
  Elasticsearch::Client.new(options)
end
