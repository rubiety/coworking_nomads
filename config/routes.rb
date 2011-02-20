CoworkingNomads::Application.routes.draw do
  resources :cities do
    get :dashboard, :on => :member
    post :activate, :on => :member
    post :deactivate, :on => :member
  end

  devise_for :users

  root :to => "home#index"
end
