Otters::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.compress = true
  config.assets.compile = true
  config.assets.digest = true
  
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    openssl_verify_mode: 'none'
  }
  
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.active_record.auto_explain_threshold_in_seconds = 0.5
  config.cache_store = :memory_store
end
