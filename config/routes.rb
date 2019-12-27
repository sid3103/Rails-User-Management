Rails.application.routes.draw do

  get 'panels/index'

  devise_for :users
  # get 'resumes/index'

  # get 'resumes/new'

  # get 'resumes/create'

  # get 'resumes/destroy'

  get 'home/index'
  resources :comments
  resources :posts do #nested routes for individual resumes/ files
  	resources :resumes	
  end
  root :to => "home#index"
  resources :panels
  # resources :resumes, only: [:index, :new, :create, :destroy]
  
end


