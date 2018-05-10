Rails.application.routes.draw do
  root "cocktails#index"
  resources :cocktails do
    resources :doses, only: [ :index, :new, :show, :create ]
  end
  resources :doses, only: [ :new, :create, :destroy ]
end
