Rails.application.routes.draw do
  get 'calculator/main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => "calculator#main"
  get "/home" => "blog#index"
  get "/test" => "blog#test"
  get "/result" => "calculator#result"
  post "/result" => "calculator#result"
  get "/plus/:num1/:num2" => "calculator#plus"
  post "/create" => "blog#create"
end
