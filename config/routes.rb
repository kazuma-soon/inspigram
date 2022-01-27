Rails.application.routes.draw do
  root to: 'top#index' 

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'

  resources :sessions, only: %i[create destroy]
  resources :boards, only: %i[index new create destroy] do
    collection do
      get 'mine'
    end
  end
end
