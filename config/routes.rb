Rails.application.routes.draw do
  get 'coin_icos/launcher_coin_icos'
  resources :comments
  resources :coin_icos
  resources :ratings, only: :update
  # devise_for :launchers
  devise_for :launchers, :controllers => { :omniauth_callbacks => "launchers/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#homepage"
end
