RspecApiDocumentation.configure do |config|
  config.docs_dir = Rails.root.join('public/docs')
  config.format = [:open_api]
  config.curl_host = 'http://localhost:3000'
  config.api_name = 'Classifier App API'
  config.api_explanation = "API Clasifier Description"
  config.request_headers_to_include = []
  config.response_headers_to_include = []
end