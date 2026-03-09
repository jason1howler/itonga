Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :contact_us
  resources :about_us
  resources :services
  resources :enquiries, only: [:create]
  
  root 'welcome#index'
end
