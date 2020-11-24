SwaggerUiEngine.configure do |config|
  config.swagger_url = '/docs/open_api.json'
  config.doc_expansion = 'full'
  config.json_editor = true
  config.translator_enabled = true
  config.model_rendering = 'model'
  config.validator_enabled = true
  config.admin_username = 'admin'
  config.admin_password = 'password'
end