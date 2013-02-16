Otters::Application.routes.draw do
  get '/login' => 'users#login'
  put '/login' => 'users#try_login'
  get '/logout' => 'users#logout'
  get '/change' => 'users#new_pass'
  put '/change' => 'users#change_pass'
  
  resources :entries, except: [:show, :index]
  
  get 'all' => 'entries#index'
  get '/all/page/:page(.:format)' => 'entries#index'
  get '/entries/:slug' => 'entries#by_slug', slug: /[\w\-]+/, as: :slug_entries
  
  get '/tagged/:tag' => 'entries#by_tag', as: :tagged
  get '/typed/:type' => 'entries#by_type', as: :typed
  
  %w[blog design code].each do |ty|
    match "/#{ty}" => 'entries#by_type', defaults: { type: ty }, as: ty.to_sym
  end
  
  get '/hire-me' => 'extras#hire', as: :hire_me
  put '/hire-me' => 'extras#email', as: :hired_me
  
  get '/signature' => 'extras#signature'

  root to: 'entries#home'
end
