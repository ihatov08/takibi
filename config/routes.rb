Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#index"
  get 'home/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  resources :projects, only: %i[show]

  resources :project_plans, only: [] do
    resources :backers, only: %i[new create]
  end
end
