Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { registrations: 'registrations' }
  #skip: [:registrations, :sessions]

#Rename routes for devise
  # devise_scope :user do
  #   get 'inscription', to: 'devise/registrations#new', as: :new_user_registration
  #   post 'inscription', to: 'devise/registrations#create', as: :user_registration
  #   get 'profil/editer', to: 'devise/registrations#edit', as: :edit_user_registration
  #   post 'profil/editer', to: 'devise/registrations#update', as: :users_edit
  #   get 'login', to: 'devise/sessions#new', as: :new_user_session
  #   post 'login', to: 'devise/sessions#create', as: :user_session
  #   delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  # end


  resources :products

  resources :users

  root 'products#index'

  #stripe
  resources :charges, only: [:new, :create]

end
