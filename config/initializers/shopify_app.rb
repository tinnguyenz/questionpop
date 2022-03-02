base_url = Rails.configuration.url['base_url']
script_tag_url = base_url + "/question_pop.js"

ShopifyApp.configure do |config|
  config.application_name = "Question Pop"
  config.api_key = ""
  config.secret = ""
  config.scope = "read_products, read_script_tags, write_script_tags"
  config.old_secret = ""
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2020-01"
  config.session_repository = 'Shop'

  config.scripttags = [
      {event:'onload', src: script_tag_url}
  ]
end




