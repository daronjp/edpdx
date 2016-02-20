Rails.application.routes.draw do
  resources :product_notes
  resources :product_categories
  namespace :hq do
    resources :users
  end
  resources :baskets
  #get 'welcome/index'
  #root 'products#index'
  root 'welcome#index'
  get 'charges/create'

  namespace :hq do
      resources :shipments
      resources :users
    end

  resources :cart_items
  resources :customers
  resources :carts
  resources :photos
  resources :products
  resources :products
  resources :welcome
  resources :sessions
  resources :charges

  get "log_out" => "sessions#destroy", :as => "log_out"
  get '/cart_items/increment/:id', to: 'cart_items#increment', :as => 'increment'
  get '/cart_items/decrement/:id', to: 'cart_items#decrement', :as => 'decrement'
  get '/about' => 'welcome#about'
  # get "cart_items/increment/:id" => "cart_items#increment"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     #   end
end
