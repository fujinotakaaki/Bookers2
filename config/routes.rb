Rails.application.routes.draw do
  get 'chats/show'
  scope :users do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
    }
  end
  resources :books, only: [:create, :destroy, :edit, :index, :show, :update] do
    resource :favorite, only: [:create, :destroy]
    resource :book_comment, only: [:create, :destroy]
  end
  resources :users,  only: [                            :edit, :index, :show, :update] do
    resource :relationship,  only: [:create, :destroy]
  end
  get 'searches' => 'searches#search'
  get '/relationships' => 'relationships#index'
  get '/home/about' => 'users#about'
  root to: 'users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
