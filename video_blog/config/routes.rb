Rails.application.routes.draw do    
  resources :videos do
      resources :comments
    end
  devise_for :users
  get '/' => 'videos#index', as: "main"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
