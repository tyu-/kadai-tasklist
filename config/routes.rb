Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'toppages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'tasks/:id', to: 'task#show'
  #post 'tasks', to: 'tasks#create'
  #put 'tasks/:id', to: 'tasks#update'
  #delete 'tasks/:id', to: 'tasks#destroy'
  
  #get 'tasks', to: 'tasks#index'
  #post 'tasks/new', to: 'tasks#new'
  #get 'tasks/:id/edit', to: 'tasks#edit'
  
  #root to: 'tasks#index'
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup' , to: 'users#new'
  resources :users, only: [:index, :show, :create]
  resources :tasks
end
