Rails.application.routes.draw do
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  root 'books#index'
  get '/about', to: 'pages#about'

  # get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/books/new', to: 'books#new'
  post '/books', to: 'books#create'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
