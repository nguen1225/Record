Rails.application.routes.draw do
  #get 'genres/index'
  #get 'genres/edit'
  #get 'users/index'
  #get "users" => "users#index"
  devise_for :users
  resources :events
  resources :genres
  root 'users#index'
  #get 'graphs/index'
  get 'searchs/searchs' => 'searchs#searchs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
     mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
