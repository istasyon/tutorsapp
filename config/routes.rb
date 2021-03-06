Rails.application.routes.draw do

devise_for :users,
             path: 'accounts',
             path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile' },
             controllers: { omniauth_callbacks: 'omniauth_callbacks',
                            registrations: 'registrations' }

  get 'users/dashboard'
  
  resources :users, only: [:index] do
    resource :timetable
    resources :listings, only: [:index, :new, :create]
  end

  resources :listings, only: [:show, :edit, :update, :destroy] do 
    resources :appointments, except: [:show]
  end

  resources :appointments, only: [:show] do
    resource :review
  end

  # root 'welcome#home'
  root 'welcome#beta_landing'  
  get 'teacher' => 'welcome#become_a_teacher'
  get 'search' => 'listings#search' 
  get 'nearby' => 'listings#nearby'
  
  
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end

  resources :messages, only: [:new, :create]

  get '/users/:user_id/location', to: 'users#location', as: :user_location

  
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
