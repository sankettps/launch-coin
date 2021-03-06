Rails.application.routes.draw do
  get 'coin_icos/launcher_coin_icos'
  get 'coin_icos/favourite_ico'
  get 'coin_icos/unfavourite_ico'
  get 'admin_coin_icos/:id/approve_ico', to: 'admin_coin_icos#approve_ico',as: :approve_ico
  get 'admin_coin_icos/:id/decline_ico', to: 'admin_coin_icos#decline_ico',as: :decline_ico
  get 'comments/like_comment'
  get 'comments/unlike_comment'
  get 'comment_replies/like_comment_reply'
  get 'comment_replies/unlike_comment_reply'
  resources :comments
  resources :coin_icos
  resources :admin_coin_icos,only: [:index]
  resources :comment_replies,only: [:new,:create]
  resources :ratings, only: :update
  # devise_for :launchers
  devise_for :launchers, :controllers => { :omniauth_callbacks => "launchers/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#homepage"
end
