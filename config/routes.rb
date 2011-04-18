CoworkingNomads::Application.routes.draw do
  resources :city_suggestions, :only => [:index, :new, :create]

  resources :cities, :path => "", :except => [:index] do
    get :dashboard, :on => :member
    post :activate, :on => :member
    post :deactivate, :on => :member

    resources :venues do
      post :activate, :on => :member
      post :deactivate, :on => :member

      resources :reviews
      resources :check_ins, :only => [:index, :new, :create, :destroy]
    end
    
    resources :venue_suggestions, :only => [:index, :new, :create]
    resources :users, :only => [:show]
  end

  devise_for :users

  resources :users, :except => [:new, :create] do
    get :change_city, :on => :member
    get :privacy, :on => :member
    get :cancel, :on => :member
  end

  root :to => "home#index"
end
