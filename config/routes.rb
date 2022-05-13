Rails.application.routes.draw do
  get 'admin/index'
  get 'cursos/index'
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'pages#index', as: :authenticated_root
      get 'pages', to: 'pages#index'
      get 'about', to: 'pages#about'
      resources :cursos do
        resources :students
        get 'students', to: 'students#new'
      end
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end

