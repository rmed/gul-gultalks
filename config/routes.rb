Gultalks::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # API Documentation
  match 'apidocs', to: 'api_docs#index', via: :get, path: '/apidocs'

  # Verifiers
  match 'verify', to: 'verifier#verify', via: :get, path: '/verify'

  # Conferences
  match 'conferences', to: 'conferences#index', via: :get, path: '/conferences'
  match 'conference', to: 'conferences#show', via: :get, path: '/:id'

  # Event creation
  match 'new_conference_event', to: 'events#new', via: :get, path: '/:conference_id/new'
  match 'basic_events', to: 'events#new_basic', via: :get, path: '/:conference_id/new/basic'
  match 'create_basic_event', to: 'events#create_basic', via: :post, path: '/:conference_id/new/basic'
  match 'detailed_events', to: 'events#new_detailed', via: :get, path: '/:conference_id/new/detailed'
  match 'create_detailed_event', to: 'events#create_detailed', via: :post, path: '/:conference_id/new/detailed'

  # Events
  match 'conference_events', to: 'events#index', via: :get, path: '/:conference_id/events'
  match 'conference_event', to: 'events#show', via: :get, path: '/:conference_id/:id'
  match 'propose_speaker_conference_event', to: 'events#propose_speaker', via: :get, path: '/:conference_id/:id/propose_speaker'
  match 'send_speaker_conference_event', to: 'events#send_speaker', via: :post, path: '/:conference_id/:id/propose_speaker'
  match 'vote_conference_event', to: 'events#vote', via: :get, path: '/:conference_id/:id/vote'
  match 'send_vote_conference_event', to: 'events#send_vote', via: :post, path: '/:conference_id/:id/vote'

  # Comments
  resources :comments, path: '/:conference_id/:event_id/comments'


  #resources :conferences, path: '/conferencesevents#send_speaker', only: [:index]
  #resources :conferences, path: '', except: [:index] do
  #  resources :events, path: '/events', only: [:index]
  #  resources :events, path: '', except: [:index] do
  #    resources :comments, path: '/comments'
  #    member do
  #      get 'propose_speaker'
  #      post 'send_speaker'
  #      get 'vote'
  #      post 'send_vote'
  #    end
  #  end
  #  resources :event_wizard, path: '/new'
  # end


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
  # root :to => 'welcome#index'
  root 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
