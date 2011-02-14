ProjectManager::Application.routes.draw do
  resources :project_colors

  resources :zone_levels

  resources :machines

  resources :project_scopes

  resources :travel_restrictions

  resources :restrictions

  resources :supervisor_levels

  resources :skill_levels

  get "home/index"
  get "home/canvas"
  get "home/slider_test"

  resources :technicians

  match "zones/add" => "zones#add"
  match "zones/add_technician" => "zones#add_technician"
  match "zones/remove_technician" => "zones#remove_technician"

  resources :zones

  resources :project_types


  match "projects/add_technician" => "projects#add_technician"
  match "projects/remove_technician" => "projects#remove_technician"
  match "projects/event_drop" => "projects#event_drop"
  match "projects/event_resize" => "projects#event_resize"

  resources :projects

  get "home/picklists"
  get "home/json_feed"

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
  # root :to => "welcome#index"

  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
