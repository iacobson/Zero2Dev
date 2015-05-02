Rails.application.routes.draw do

  get 'users/show'

  get 'static_pages/home'

  get 'resources/index'

  get 'projects/index'

  get 'jobs/index'

  get 'collaborations/index'

  get 'collaboration/index'

  root 'static_pages#home'

  # Added our custom 'registrations' controller to Devise in order to allow 'name' for the user
  # Tutorial here: http://jacopretorius.net/2014/03/adding-custom-fields-to-your-devise-user-model-in-rails-4.html
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :resources
  resources :projects
  resources :collaborations
  resources :jobs
  resources :users, only: [:show]

end
