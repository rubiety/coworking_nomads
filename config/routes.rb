CoworkingNomads::Application.routes.draw do
  resources :city_suggestions
  resources :cities do
    get :dashboard, :on => :member
    post :activate, :on => :member
    post :deactivate, :on => :member

    resources :venues do
      post :activate, :on => :member
      post :deactivate, :on => :member
    end

    resources :venue_suggestions
  end

  devise_for :users

  root :to => "home#index"
end
