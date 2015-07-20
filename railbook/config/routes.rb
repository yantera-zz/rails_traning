require 'TimeConstraint'

Rails.application.routes.draw do
  # resources :members
  # resources :fan_comments
  resources :reviews, as: :comments
  resources :authors
  # resources :users, controller: :members
  #resources :users, except: [ :show, :destroy ]
  resources :users, only: [ :index, :new, :create, :edit, :update ]
  # resources :books, constraints: TimeConstraint.new
  resources :books, format: false
  resources :config
  get 'hello/show'

  resources :books
  resources :books
  resources :books
  resources :books
  get 'hell/show'

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
  match ':controller(/:action(/:id))', via: [ :get, :post, :patch ]
  
  namespace :admin do
    resources :books
  end

  scope module: :admin do
    resources :books
  end

  resources :reviews do
  #  collection do
  #    get :unapproval
  #  end
  #  member do
  #    get :draft
  #  end
    get :unappeoval, on: :collection
    get :draft, on: :member
  end

  resources :users do
    get :unappeoval, on: :collection
    get :draft, on: :member
  end
 
  resources :books do
    # resources :reviews, shallow: true
    resources :reviews, only: [ :index, :new, :create ]
  end
  resources :reviews, expect: [ :index, :new, :create ]
 
  scope shallow_path: :b do
    resources :books do
      resources :reviews, shallow: true
    end
  end

  scope shallow_prefix: :b do
    resources :books do
      resources :reviews, shallow: true
    end
  end
  
  root to: 'books#index'
end
