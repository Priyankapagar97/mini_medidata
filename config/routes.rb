Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'create_study/:study_group_id', to: 'studies#create'
  get 'studies/:study_group_id', to: 'studies#index'
  patch 'update_study/:id', to: 'studies#update'
  delete 'delete_study/:id', to: 'studies#destroy'
  get 'active_studies', to: 'studies#active'
  post 'create', to: 'study_groups#create'
  get 'study_groups', to: 'study_groups#index'
  post 'participants', to: 'participants#create'

  resources :studies

  resources :users
end
