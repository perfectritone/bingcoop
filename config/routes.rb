Coop::Application.routes.draw do

  match '/recipes/vegetarian', to: "recipes#index", diet: "vegetarian"
  match '/recipes/vegan', to: "recipes#index", diet: "vegan"
  match '/recipes/meat', to: "recipes#index", diet: "meat"
  match '/recipes/veg', to: "recipes#index_scoped", diet: "vegetarian"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :recipes
  resources :resources, only: [:index]
  resources :suggestions, only: [:index, :show, :create]
  resources :searches, only: [:new, :create, :show]

  root :to => 'static_pages#home'
  
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy', via: :delete
  
  match '/about', to: 'static_pages#about'
  match '/menu', to: 'static_pages#menu'
  match '/get_involved', to: 'static_pages#get_involved'
  match '/products', to: 'static_pages#products'
  match '/personal_orders', to: 'static_pages#personal_orders'
  match '/contact', to: 'static_pages#contact'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
