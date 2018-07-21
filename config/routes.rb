# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#            product_index GET    /product/index(.:format)       product#index
#               rental_box GET    /rental_box(.:format)          rental_boxes#show
#                     root GET    /                              menu#index
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                 labwares GET    /labwares(.:format)            labwares#index
#                          POST   /labwares(.:format)            labwares#create
#              new_labware GET    /labwares/new(.:format)        labwares#new
#             edit_labware GET    /labwares/:id/edit(.:format)   labwares#edit
#                  labware GET    /labwares/:id(.:format)        labwares#show
#                          PATCH  /labwares/:id(.:format)        labwares#update
#                          PUT    /labwares/:id(.:format)        labwares#update
#                          DELETE /labwares/:id(.:format)        labwares#destroy
#                  rentals GET    /rentals(.:format)             rentals#index
#                          POST   /rentals(.:format)             rentals#create
#               new_rental GET    /rentals/new(.:format)         rentals#new
#              edit_rental GET    /rentals/:id/edit(.:format)    rentals#edit
#                   rental GET    /rentals/:id(.:format)         rentals#show
#                          PATCH  /rentals/:id(.:format)         rentals#update
#                          PUT    /rentals/:id(.:format)         rentals#update
#                          DELETE /rentals/:id(.:format)         rentals#destroy
#           rental_details POST   /rental_details(.:format)      rental_details#create
#            rental_detail PATCH  /rental_details/:id(.:format)  rental_details#update
#                          PUT    /rental_details/:id(.:format)  rental_details#update
#                          DELETE /rental_details/:id(.:format)  rental_details#destroy
#           api_box_opener GET    /api/box_opener(.:format)      api/box_opener#index {:format=>/json/}
# 

Rails.application.routes.draw do

  get 'product/index'

  resource :rental_box, only: [:show]

  root "menu#index"
  
  devise_for :users
  
  resources :labwares
  resources :rentals
  resources :rental_details, only: [:create, :update, :destroy]
  
  namespace :api, {format: 'json'} do
    namespace :box_opener do
        get "/" , :action => "index"
    end
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
