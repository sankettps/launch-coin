Rails.application.routes.draw do
  devise_for :launchers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#homepage"
end
