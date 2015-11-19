Rails.application.routes.draw do 

  get '/api/test', to: 'api/user#test', defaults: { format: :json }
  
  get '/api/user/is_login', to: 'api/user#is_login', defaults: { format: :json }
  get '/api/user/logout', to: 'api/user#logout', defaults: { format: :json }
  get '/api/pin/:id/comment', to: 'api/pin#comment', defaults: { format: :json }
  post '/api/user/login', to: 'api/user#login', defaults: { format: :json }
  post '/api/pin/liked', to: 'api/pin#liked', defaults: { format: :json }
  post '/api/comment/liked', to: 'api/comment#liked', defaults: { format: :json }


  get '/api/pin/check_expired', to: 'api/pin#check_expired', defaults: { format: :json }

  namespace :api, defaults: { format: :json } do
    resources :user
  end
  namespace :api, defaults: { format: :json } do
    resources :pin
  end
  namespace :api, defaults: { format: :json } do
    resources :comment
  end
  namespace :api, defaults: { format: :json } do
    resources :notification
  end
  
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
  #     resources :products
  #   end
end
