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
  end

  devise_for :users

  root :to => "home#index"
end
