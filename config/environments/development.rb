Otters::Application.configure do
  config.cache_classes = false
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  config.action_mailer.delivery_method = :test
  config.active_support.deprecation = :log
  config.action_dispatch.best_standards_support = :builtin
  config.assets.compress = false
  config.cache_store = :null_store
  config.eager_load = false
end
