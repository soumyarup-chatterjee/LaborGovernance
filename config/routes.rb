Rails.application.routes.draw do
  resources :requests
  root to: 'home#index'

  get 'home/index'
  get 'home/creator'
  get 'home/mission'
  #if current_user
  #get 'labourers#index', as: :user_root
  #end
  get '/home/user_area', as: :user_root
  get '/home/company_area', as: :company_root
  #get '/users' => '/home/user_area', as: :user_root
  get '/labourers/:id/hire', to: 'labourers#hire', as: :new_hire
  resources :labourers

  get '/companys', to: 'home#company_area'
  get '/users', to: 'home#user_area'

  devise_for :companys, controllers: {
    sessions: 'companys/sessions',
    registrations: 'companys/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
