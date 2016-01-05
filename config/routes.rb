Rails.application.routes.draw do 

  get '/api/test', to: 'api/user#test', defaults: { format: :json }
  
  get '/api/user/is_login', to: 'api/user#is_login', defaults: { format: :json }
  get '/api/user/logout', to: 'api/user#logout', defaults: { format: :json }
  get '/api/pin/:id/comment', to: 'api/pin#comment', defaults: { format: :json }
  get '/api/pin/mine', to: 'api/pin#mine', defaults: { format: :json }
  post '/api/user/login', to: 'api/user#login', defaults: { format: :json }
  post '/api/user/update_info', to: 'api/user#update_info', defaults: { format: :json }
  post '/api/user/prof_img', to: 'api/user#prof_img', defaults: { format: :json }
  post '/api/pin/liked', to: 'api/pin#liked', defaults: { format: :json }
  post '/api/comment/liked', to: 'api/comment#liked', defaults: { format: :json }

  post '/api/notification/read', to: 'api/notification#read', defaults: { format: :json }

  post '/api/message/send_text', to: 'api/message#send_text', defaults: { format: :json }
  get '/api/message/roomid', to: 'api/message#roomid', defaults: { format: :json }
  get '/api/message/content', to: 'api/message#content', defaults: { format: :json }

  get '/api/friend/search', to: 'api/friend#search', defaults: { format: :json }

  get '/api/pin/check_expired', to: 'api/pin#check_expired', defaults: { format: :json }

  # Sessions

  get '/', to: 'sessions#index'
  get '/index', to: 'sessions#index'
  get '/index2', to: 'sessions#index2', as: 'index2'
  get '/profile', to: 'sessions#profile'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('session#index')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]


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
  namespace :api, defaults: { format: :json } do
    resources :message
  end
  namespace :api, defaults: { format: :json } do
    resources :friend
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
