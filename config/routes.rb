Rails.application.routes.draw do
  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions'
  }
  devise_for :users, :controllers => {
    :sessions => 'users/sessions'
  }

  get 'homes/about' => 'homes#about'

  namespace :admins do
    resources :users, only: [:index]
    resources :contacts, only: [:index, :edit, :update]
    delete 'contacts/destroy_all' => 'contacts#destroy_all'
  end


  scope module: :users do
    resources :events
    resources :genres
    root 'users#index'
    get 'searchs/searchs' => 'searchs#searchs'
    delete 'searchs/searchs/:id' => 'searchs#destroy'
    get 'graphs' => 'graphs#index'
    resources :contacts, only: [:new, :create]
    resources :notifications, only: [:index]
    get 'contacts/complete' => 'contacts#complete'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
     mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
