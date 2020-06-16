Rails.application.routes.draw do
  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions'
  }
  devise_for :users


  namespace :admins do
    resources :users, only: [:index]
  end


  scope module: :users do
    resources :events
    resources :genres
    root 'users#index'
  end
  #get 'graphs/index'
  get 'searchs/searchs' => 'searchs#searchs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
     mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
