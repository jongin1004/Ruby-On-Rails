Rails.application.routes.draw do
  resources :scaffold_blogs do
    resources :comments
  end
  get 'calculator/main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root :to => "calculator#main"
  get "/home" => "blog#index"
  # get "/test" => "blog#test"
  # get "/result" => "calculator#result"
  # post "/result" => "calculator#result"
  # get "/plus/:num1/:num2" => "calculator#plus"
  post "/post/create" => "blog#create"
  get "/update/:id" => "blog#update"
  post "/updateAction" => "blog#updateAction"
  get "/delete/:id" => "blog#delete"
  get "/show/:id" => "blog#show"
  post "/comment/create" => "post_comments#create"
  get "comment/delete/:id" => "post_comments#destroy"
  get '/articles' => "articles#index"
  get "/articles/new" => "articles#new"
  post "/articles" => "articles#create"
  get "/articles/:id/edit" => "articles#edit"
  get "/articles/:id" => "articles#show"
  delete "/articles/:id" => "articles#destroy"
end
