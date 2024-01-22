Rails.application.routes.draw do
  resources :categories
  resources :discussions do
    resources :comments 
  end
  root "discussions#index"
  resource :registration
  resource :session
end
