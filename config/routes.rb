Rails.application.routes.draw do
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
  resources :tasks
end
