Otters::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  get '/login' => 'users#login'
  put '/login' => 'users#try_login'
  get '/logout' => 'users#logout'
  
  resources :entries, :except => [:show]
  
  get 'all' => 'entries#index'
  get '/entries/:slug' => 'entries#by_slug', :slug => /[\w\-]+/, :as => :slug_entries
  
  get '/tagged/:tag' => 'entries#by_tag', :as => :tagged
  get '/typed/:type' => 'entries#by_type', :as => :typed
  
  %w[blog design code].each do |ty|
    match "/#{ty}" => 'entries#by_type', :defaults => { :type => ty }, :as => ty.to_sym
  end
  
  get '/hire-me' => 'extras#hire', :as => :hire_me
  put '/hire-me' => 'extras#email', :as => :hired_me

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  
  root :to => 'entries#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
