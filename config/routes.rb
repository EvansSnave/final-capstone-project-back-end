Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :doctors, only: [:create, :index, :show, :destroy]
  resources :reservations, only: [:create, :destroy, :show, :index]
  resources :details, only: [:show]
  resources :users, only: [:index]
end
