Airmule::Application.routes.draw do
  resources :sessions
  
  root :to => 'static#index' 
  get "/" => "static#index"
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout'=> 'sessions#destroy', as: 'signout'
  get 'trips/new' => 'trips#new'
  post 'trips/create' => 'trips#create'
  post 'messages/create/:user_id' => 'messages#create'
  post 'messages/reply_to_email/:email' => 'messages#reply_to_email', constraints:{ email: /[^\/]+/ }
  post 'messages/reply_to_user/:user_id' => 'messages#reply_to_user'
  get 'messages/show' => 'messages#show'
  get 'search/:search_params' => 'search#search'
  get 'user/:user_id' => 'user#show'
  get 'messages/:conversation' => 'messages#message', constraints:{ conversation: /[^\/]+/ }
  get 'user/:user_id/trips' => 'trips#show_by_user'

  #Ultimo para redireccion de errores
  #Todo 404 page
  #get '*path' => redirect('/')

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
