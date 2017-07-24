Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in:  'login',
                                             sign_out: 'logout',
                                             sign_up:  'register'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ####
  root to: "users#index"
  resources :conversation do
    resources :users, only: [:new, :create]
  end

  resources :users, except: [:new, :create] do
    resources :messages, only: [:create]
  end
end
